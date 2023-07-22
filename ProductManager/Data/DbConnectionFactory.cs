using System.Data;

namespace ProductManager.Data
{
    public interface IDbConnectionFactory
    {

        IDbConnection CreateConnection();
        Task<IDbConnection> CreateOpenConnectionAsync();
    }
}
