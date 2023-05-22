using LanguageExt.Common;
using ProductManager.DTO.Pagination;
using ProductManager.DTO.Product;
using ProductManager.Models.Product;
using ProductManager.Result.Product;

namespace ProductManager.Services
{
    public interface IProductService
    {
        Task<Result<bool>> UpdateAsync(UpdateProductDto updateProduct);
        Task<Result<bool>> CreateAsync(CreateProductDto createProduct);
        Task<IEnumerable<Product>> GetAllProducts(PaginationDTO? pagination);
        Task<Product> GetProduct(Guid id);
        Task<Result<bool>> DeleteAsync(Guid id);
    }
}
