using Dapper;
using model = ProductManager.Models.Product;
using System.Data;
using System.Data.SqlClient;
using ProductManager.Data;
using ProductManager.DTO.Product;

namespace ProductManager.Repository.Product
{
    public class ProductRepository : IProductRepository
    {
        private readonly IConfiguration _configuration;

        public ProductRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<int> CreateAsync(string name)
        {
            var procedure = "pmc.Brand_CreateBrand";

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                return await connection.ExecuteAsync(procedure, name, commandType: CommandType.StoredProcedure);

            }
        }

        public async Task<bool> UpdateAsync(model.Product updateBrand)
        {
            var procedure = "pmc.Product_UpdateProduct";

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                return await connection.ExecuteAsync(procedure, updateBrand, commandType: CommandType.StoredProcedure);

            }
        }

        public async Task<model.Product> GetProduct(int id)
        {
            var procedure = "pmc.Product_GetProductById";

            // Sing the Dapper Connection string we open a connection to the database
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();

                return await connection.QuerySingleAsync<model.Product>(procedure, id, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<int> DeleteAsync(int id)
        {
            var procedure = "pmc.Product_DeleteProduct";

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                return await connection.ExecuteAsync(procedure, id, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<model.Product>> GetAll(Paging? paging)
        {
            paging ??= new Paging();

            var parameters = new DynamicParameters(
            {
                ProductId = 1,
                Test = 2
            });
            var procedure = "pmc.Product_GetAllProducts";

            // Sing the Dapper Connection string we open a connection to the database
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();

                return await connection.QueryAsync<model.Product>(procedure, commandType: CommandType.StoredProcedure);
                
            }
        }
    }
}
