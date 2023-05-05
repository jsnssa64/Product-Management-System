using Dapper;
using ProductManager.DTO.Brand;
using model = ProductManager.Models;
using System.Data;
using System.Data.SqlClient;
using ProductManager.DTO.Product;

namespace ProductManager.Repository.Brand
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

        public async Task<int> UpdateAsync(UpdateBrand updateBrand)
        {
            var procedure = "pmc.Brand_UpdateBrand";

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                return await connection.ExecuteAsync(procedure, updateBrand, commandType: CommandType.StoredProcedure);

            }
        }

        public async Task<model.Brand.Brand> GetBrandById(int Id)
        {
            var procedure = "pmc.Brand_GetBrandById";

            // Sing the Dapper Connection string we open a connection to the database
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();

                return await connection.QuerySingleAsync<model.Brand.Brand>(procedure, Id, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<int> DeleteAsync(string Name)
        {
            var procedure = "pmc.Brand_DeleteBrand";

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                return await connection.ExecuteAsync(procedure, Name, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IReadOnlyList<model.Brand.Brand>> GetAll()
        {
            var procedure = "pmc.Brand_GetAllBrands";

            // Sing the Dapper Connection string we open a connection to the database
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();

                var results = await connection.QueryAsync<model.Brand.Brand>(procedure, commandType: CommandType.StoredProcedure);
                return results.ToList().AsReadOnly();
            }
        }
    }
}
