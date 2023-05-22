using Dapper;
using ProductManager.DTO.Brand;
using model = ProductManager.Models.Brand;
using System.Data;
using System.Data.SqlClient;
using ProductManager.Data;

namespace ProductManager.Repository.Brand
{
    public class BrandRepository : IBrandRepository
    {
        private readonly IConfiguration _configuration;

        public BrandRepository(IConfiguration configuration)
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
        
        public async Task<int> DeleteAsync(string name)
        {
            var procedure = "pmc.Brand_DeleteBrand";

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                return await connection.ExecuteAsync(procedure, name, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<model.Brand> GetBrand(string name)
        {
            var procedure = "pmc.Brand_GetBrandByName";

            // Sing the Dapper Connection string we open a connection to the database
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();

                return await connection.QuerySingleAsync<model.Brand>(procedure, name, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<model.Brand>> GetAll(Paging? paging)
        {
            paging ??= new Paging();
            var procedure = "pmc.Brand_GetAllBrands";

            // Sing the Dapper Connection string we open a connection to the database
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                return await connection.QueryAsync<model.Brand>(procedure, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
