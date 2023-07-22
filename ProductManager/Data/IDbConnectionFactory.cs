using System.Data;

namespace ProductManager.Data
{
    public abstract class DbConnectionFactory : IDbConnectionFactory
    {
        public abstract IDbConnection CreateConnection();
        public abstract Task<IDbConnection> CreateOpenConnectionAsync();
    }
}
