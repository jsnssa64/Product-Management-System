using ProductManager.Data;
using ProductManager.DTO.Product;
using model = ProductManager.Models.Product;

namespace ProductManager.Repository.Product
{
    public interface IProductRepository
    {
        public Task<AllProductsDto> GetProductsWithPagination(Paging paging);

        //  this will be very small so this should be details or add another endpoint called
        //  GetProductInfo for just basic distincted info
        public Task<bool> CreateAsync(model.Product product);
        public Task<bool> UpdateAsync(model.Product product);
        public Task<model.Product> GetProduct(Guid id);
    }
}
