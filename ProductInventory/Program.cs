using EventStore.ClientAPI;
using MassTransit;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var eventStoreConnectionString = builder.Configuration["EventStore:ConnectionString"];
var eventStoreConnection = EventStoreConnection.Create(new Uri(eventStoreConnectionString));

eventStoreConnection.ConnectAsync().GetAwaiter().GetResult();

builder.Services.AddMassTransit(config =>
{
    config.UsingRabbitMq();
});

builder.Services.AddSingleton(eventStoreConnection);

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
