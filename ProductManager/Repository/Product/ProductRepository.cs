using Dapper;
using ProductManager.Data;
using ProductManager.DTO.Product;
using System.Data;
using System.Data.SqlClient;
using model = ProductManager.Models.Product;

namespace ProductManager.Repository.Product
{
    public class ProductRepository : IProductRepository
    {
        private readonly IConfiguration _configuration;
        public const string GetProductSP = "[pmc].[Product_GetProduct]";
        public const string GetAllProductWithPaginationSP = "[pmc].[Product_GetAllProductsWithPagination]";
        public const string GetAllProductsSP = "[pmc].[Product_GetAllProducts]";
        public const string CreateProductSP = "[pmc].[Product_CreateProduct]";
        public const string UpdateProductSP = "[pmc].[Product_UpdateProduct]";

        public ProductRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<bool> CreateAsync(model.Product product)
        {
            await using var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            connection.Open();
            var result = await connection.ExecuteAsync(CreateProductSP, product, commandType: CommandType.StoredProcedure);
            return result > 0;
        }

        public async Task<bool> UpdateAsync(model.Product product)
        {
            await using var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            connection.Open();
            var result = await connection.ExecuteAsync(UpdateProductSP, product, commandType: CommandType.StoredProcedure);
            return result > 0;
        }

        public async Task<model.Product> GetProduct(Guid id)
        {
            // Sing the Dapper Connection string we open a connection to the database
            await using var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            connection.Open();

            return await connection.QuerySingleAsync<model.Product>(GetProductSP, id, commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<model.Product>> GetAllProducts()
        {
            await using var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            connection.Open();
            return await connection.QueryAsync<model.Product>(GetAllProductsSP, null,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<AllProductsDto> GetProductsWithPagination(Paging? paging)
        {
            paging ??= new Paging();

            var parameters = new DynamicParameters(paging.GetKeyValuePair());

            await using var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            connection.Open();

            using var query = await connection.QueryMultipleAsync(GetAllProductWithPaginationSP, commandType: CommandType.StoredProcedure, param: parameters)
                .ConfigureAwait(false);

            //  Not result, must be just for repo model
            var result = new AllProductsDto();
            result.Products.ToList().AddRange((await query.ReadAsync<model.Product>()
                    .ConfigureAwait(false))
                .AsList());
            result.TotalRecordCount = await query.ReadSingleAsync<int>().ConfigureAwait(false);
                
            return result;
        }
    }
}
