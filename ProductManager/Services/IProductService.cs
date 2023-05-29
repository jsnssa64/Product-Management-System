using LanguageExt.Common;
using ProductManager.Data;
using ProductManager.DTO.Product;
using ProductManager.Models.Product;

namespace ProductManager.Services
{
    public interface IProductService
    {
        Task<Result<bool>> UpdateAsync(Product updateProduct);
        Task<Result<bool>> CreateAsync(Product createProduct);
        Task<AllProductsDto> GetProductsWithPagination(Paging paging);
        Task<Product> GetProduct(Guid id);
        Task<Result<bool>> DeleteAsync(Guid id);
    }
}
