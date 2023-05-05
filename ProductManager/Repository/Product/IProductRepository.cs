using ProductManager.Data;
using dtoModel = ProductManager.DTO.Product;
using model = ProductManager.Models.Product;

namespace ProductManager.Repository.Product
{
    public interface IProductRepository
    {
        public Task<IEnumerable<model.Product>> GetAll(Paging? paging);
        public Task<int> CreateAsync(string name);
        public Task UpdateAsync(dtoModel.UpdateProduct product);
        public Task<model.Product> GetProduct(Guid id);
    }
}
