using ProductManager.DTO.Product;

namespace ProductManager.Services
{
    public interface IProductService
    {
        Task UpdateAsync(UpdateProduct product);

        Task DeleteAsync(int id);
    }
}
