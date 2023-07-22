using HealthChecks.UI.Client;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using ProductManager.Data;
using ProductManager.Misc;
using ProductManager.Repository.Brand;
using ProductManager.Repository.Product;
using ProductManager.Services;

var builder = WebApplication.CreateBuilder(args);
var config = builder.Configuration;

builder.Services.AddControllers();

builder.Services.AddHealthChecks()
    .AddSqlServer(
        config.GetConnectionString("DefaultConnection"));

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.CustomSchemaIds(type => type.ToString());
});
builder.Services.Configure<ConnectionStrings>(builder.Configuration.GetSection("ConnectionStrings"));
builder.Services.AddTransient<IProductRepository, ProductRepository>();
builder.Services.AddTransient<IBrandRepository, BrandRepository>();
builder.Services.AddTransient<IBrandService, BrandService>();
builder.Services.AddSingleton<IDbConnectionFactory, SqlConnectionFactory>();

var app = builder.Build();
app.UseSwagger();
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWhen(context => context.Request.Query.ContainsKey("trigger"), appBuilder => HandleBranchAndRejoin(appBuilder));
    
    app.UseSwaggerUI();
}
else
{
    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint("/swagger/v1/swagger.json", "MyDotnet6App API v1");
        options.RoutePrefix = string.Empty;
    });
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}



app.UseAuthorization();
app.MapHealthChecks("/_health", new HealthCheckOptions()
{
    ResponseWriter = UIResponseWriter.WriteHealthCheckUIResponse
});
//Dont forget to add limitation to who can access the health check -Nick mentions limiting it to a network similar to the vpn situation

app.MapControllers();

app.Run();

void HandleBranchAndRejoin(IApplicationBuilder app)
{
    var logger = app.ApplicationServices.GetRequiredService<ILogger<Program>>();

    app.Use(async (context, next) =>
    {
        var triggerVer = context.Request.Query["trigger"];
        logger.LogInformation("Branch used = {triggerVer}", triggerVer);

        await next();
    });
}