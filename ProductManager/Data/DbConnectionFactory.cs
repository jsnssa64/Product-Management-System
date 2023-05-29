using System.Data;

namespace ProductManager.Data
{
    public interface IDbConnectionFactory
    {

        Task<IDbConnection> CreateConnectionAsync();
        Task<IDbConnection> CreateOpenConnectionAsync();
    }
}
