using Microsoft.Extensions.Diagnostics.HealthChecks;
using ProductManager.Data;

namespace ProductManager.Health
{
    public class ExampleDatabaseHealthCheck : IHealthCheck
    {
        private readonly IDbConnectionFactory _dbConnectionFactory;

        public ExampleDatabaseHealthCheck(DbConnectionFactory dbConnectionFactory)
        {
            _dbConnectionFactory = dbConnectionFactory;
        }
        public async Task<HealthCheckResult> CheckHealthAsync(HealthCheckContext context, CancellationToken cancellationToken = new CancellationToken())
        {
            try
            {
                using var connection = await _dbConnectionFactory.CreateOpenConnectionAsync();
                using var command = connection.CreateCommand();
                command.CommandText = "SELECT 1";
                command.ExecuteScalar();
                return HealthCheckResult.Healthy();
            }
            catch (Exception ex)
            {
                return HealthCheckResult.Unhealthy(exception: ex);

            }
            
        }
    }
}
