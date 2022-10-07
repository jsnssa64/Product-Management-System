using ProductManager.DTO.Brand;
using model = ProductManager.Models.Brand;

namespace ProductManager.Repository.Brand
{
    public interface IBrandRepository
    {
        public Task<IReadOnlyList<model.Brand>> GetAll();
        public Task<int> CreateAsync(String Name);
        public Task<int> UpdateAsync(UpdateBrandDTO updateBrand);
        public Task<int> DeleteAsync(String Name);
        public Task<model.Brand> GetBrandById(int Id);
    }
}
