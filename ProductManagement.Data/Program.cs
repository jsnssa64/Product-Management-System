using DbUp;
using DbUp.Helpers;
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

EnsureDatabase.For.SqlDatabase(connectionString);
Console.WriteLine("\nIMPORTANT: Please ensure your scripts are EMBEDDED in the executable.");

//  Base 
var baseNamespace = Assembly.GetExecutingAssembly().GetName().Name;

//  Environment
var environmentsNamespace = $"{baseNamespace}.Environments.{configuration["DataVariable.Environment"]}";

var deploymentNamespaces = configuration.GetSection(nameof(DeploymentNamespaces))
                                    .Get<DeploymentNamespaces>();

//  Variables
var variables = configuration.AsEnumerable().Where(x => x.Key.StartsWith("DataVariable.")).ToDictionary(x => x.Key.Replace("DataVariable.", ""), x => x.Value);
foreach (var pair in variables)
{
    Console.WriteLine($"{pair.Key} = \"{pair.Value}\"");
}

//  Base Schema Build
string preDeploymentScriptsPath = baseNamespace + ".PreDeployment";
RunMigrations(connectionString, preDeploymentScriptsPath, variables);

//  Environment Pre-Deployments (Optional)
if (deploymentNamespaces != null && !string.IsNullOrEmpty(deploymentNamespaces.PreDeploymentNamespace))
{
    RunMigrations(connectionString, environmentsNamespace + deploymentNamespaces.PreDeploymentNamespace, variables);
}

//  Base Migrations
var migrationScriptsPath = baseNamespace + ".Migrations";
RunMigrations(connectionString, migrationScriptsPath, variables);

//  Base Post Deployments
string postDeploymentScriptsPath = baseNamespace + ".PostDeployment";
RunMigrations(connectionString, postDeploymentScriptsPath, variables);
RunMigrations(connectionString, baseNamespace, variables, true);

//  Optional Environment Post Deployments
if (deploymentNamespaces != null && !string.IsNullOrEmpty(deploymentNamespaces.PostDeploymentNamespace))
{
    RunMigrations(connectionString, environmentsNamespace + deploymentNamespaces.PostDeploymentNamespace, variables);
    RunMigrations(connectionString, environmentsNamespace, variables, true);
}

return 0;

static int RunMigrations(string connectionString, 
    string @namespace,
    Dictionary<string, string> variables,
    bool alwaysRun = false)
{
    if (alwaysRun)
    {
        @namespace = $"{@namespace}.alwaysrun";
    }

    Console.WriteLine($"Executing scripts in {@namespace}");

    var upgraderBuilder =
        DeployChanges.To
            .SqlDatabase(connectionString)
            .WithVariables(variables)
            .WithTransactionPerScript()
            .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly(), file =>
            {
                file = file.ToLower();

                var test = file
                            .StartsWith(@namespace.ToLower())
                            && alwaysRun == file.Contains($".alwaysrun");

                return test;
            });

    if(alwaysRun)
    {
        upgraderBuilder.JournalTo(new NullJournal());
    }

    var upgrader = upgraderBuilder.LogToConsole()
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