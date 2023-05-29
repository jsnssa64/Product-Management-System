using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace ProductManager.Data
{
    public class SqlConnectionFactory : DbConnectionFactory
    {
        private readonly string _connectionString;

        public SqlConnectionFactory(string connectionString)
        {
            _connectionString = connectionString;
        }

        public override async Task<IDbConnection> CreateConnectionAsync()
        {
            return new SqlConnection(_connectionString);
        }

        public override async Task<IDbConnection> CreateOpenConnectionAsync()
        {
            SqlConnection connection = (SqlConnection)await CreateConnectionAsync();
            connection.Open();

            return connection;
        }
    }
}
