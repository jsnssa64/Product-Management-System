using ProductManager.Data;
using ProductManager.DTO.Brand;
using ProductManager.DTO.Product;
using model = ProductManager.Models.Brand;

namespace ProductManager.Repository.Brand
{
    public interface IBrandRepository
    {
        public Task<IEnumerable<model.Brand>> GetAll(Paging paging);
        public Task<int> CreateAsync(string name);
        public Task<int> UpdateAsync(UpdateBrand updateBrand);
        public Task<int> DeleteAsync(String name);
        public Task<model.Brand> GetBrand(string name);
    }
}
