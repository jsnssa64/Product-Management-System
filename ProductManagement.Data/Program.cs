using DbUp;
using Microsoft.Extensions.Configuration;
using ProductManagement.Data;
using System.Reflection;

//  Production, Staging, Development
var environment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");

var configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile($"appsettings.json", false, true)
    .AddJsonFile($"appsettings.{environment}.json", true, true)
    .AddEnvironmentVariables()
    .Build();

var connectionString = configuration.GetConnectionString("connection");

//EnsureDatabase.For.SqlDatabase(connectionString);
Console.WriteLine("\nIMPORTANT: Please ensure your scripts are EMBEDDED in the executable.");

//  Base 
var baseNamespace = Assembly.GetExecutingAssembly().GetName().Name;
//  Environment
var environmentsNamespace = baseNamespace + ".Environments";

var deploymentNamespaces = configuration.GetSection(nameof(DeploymentNamespaces))
                                    .Get<DeploymentNamespaces>();

var Env = configuration["Environment"];

//  Variables
var variables = configuration.GetSection("variables")
                            .GetChildren()
                            .ToDictionary(x => x.Key, x => x.Value);
foreach (var pair in variables)
{
    Console.WriteLine($"{pair.Key} = \"{pair.Value}\"");
}

//  Base Predeployments
string preDeploymentScriptsPath = baseNamespace + ".PreDeployment";
RunMigrations(connectionString, preDeploymentScriptsPath, variables);

//  Environment Pre-Deployments (Optional)
if (deploymentNamespaces != null)
{
    RunMigrations(connectionString, deploymentNamespaces.PreDeploymentNamespace, variables);
}

//  Base Migrations
var migrationScriptsPath = baseNamespace + ".Migrations";
RunMigrations(connectionString, migrationScriptsPath, variables);

//  Base Post Deployments
string postDeploymentScriptsPath = baseNamespace + ".PostDeployment";
RunMigrations(connectionString, postDeploymentScriptsPath, variables);

//  Optional Environment Post Deployments
if (deploymentNamespaces != null)
{
    RunMigrations(connectionString, deploymentNamespaces.PreDeploymentNamespace, variables);
}

//await host.RunAsync();
return 0;

static int RunMigrations(string connectionString, 
    string @namespace,
    Dictionary<string, string> variables)
{
    Console.WriteLine($"Executing scripts in {@namespace}");
    var upgrader =
        DeployChanges.To
            .SqlDatabase(connectionString)
            .WithVariables(variables)
            .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly(), file =>
            {
                return file
                        .ToLower()
                        .StartsWith(@namespace.ToLower());
            })
            .LogToConsole()
            .Build();

    var result = upgrader.PerformUpgrade();

    if (!result.Successful)
    {
        ShowError(result.Error);
        return -1;
    }

    ShowSuccess();
    return 0;
}

static void ShowSuccess()
{
    Console.ForegroundColor = ConsoleColor.Green;
    Console.WriteLine("Success!");
    Console.ResetColor();
}

static void ShowError(Exception exception)
{
    Console.ForegroundColor = ConsoleColor.Red;
    Console.WriteLine(exception);
    Console.ResetColor();
#if DEBUG
    Console.ReadLine();
#endif
}