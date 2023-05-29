using System.Data;

namespace ProductManager.Data
{
    public abstract class DbConnectionFactory : IDbConnectionFactory
    {

        public abstract Task<IDbConnection> CreateConnectionAsync();
        public abstract Task<IDbConnection> CreateOpenConnectionAsync();
    }
}
