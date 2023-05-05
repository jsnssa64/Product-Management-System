using ProductManager.DTO.Brand;
using ProductManager.DTO.Product;
using model = ProductManager.Models.Brand;

namespace ProductManager.Repository.Brand
{
    public interface IBrandRepository
    {
        public Task<IReadOnlyList<model.Brand>> GetAll();
        public Task<int> CreateAsync(string Name);
        public Task<int> UpdateAsync(UpdateBrand updateBrand);
        public Task<int> DeleteAsync(String Name);
        public Task<model.Brand> GetBrand(string Name);
    }
}
