using Microsoft.Extensions.Options;
using System.Data;
using System.Data.SqlClient;
using ProductManager.Misc;

namespace ProductManager.Data
{
    public class SqlConnectionFactory : DbConnectionFactory
    {
        private readonly string _connectionString;

        public SqlConnectionFactory(IOptions<ConnectionStrings> connectionStringsOptions)
        {
            _connectionString = connectionStringsOptions.Value.DefaultConnection; 
        }

        public override IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }

        public override async Task<IDbConnection> CreateOpenConnectionAsync()
        {
            SqlConnection connection = (SqlConnection)CreateConnection();
            await connection.OpenAsync();

            return connection;
        }
    }
}
