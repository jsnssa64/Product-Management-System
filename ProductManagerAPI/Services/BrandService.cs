using ProductManager.Repository.Brand;

namespace ProductManager.Services
{
    public class BrandService
    {
        private readonly IBrandRepository _brandRepository;
        public BrandService(IBrandRepository brandRepository)
        {
            _brandRepository = brandRepository;
        }

        //  Is this necessary?
    }
}
