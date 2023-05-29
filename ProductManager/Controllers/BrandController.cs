using Microsoft.AspNetCore.Mvc;
using ProductManager.DTO.Brand;
using ProductManager.Repository.Brand;
using ProductManager.Services;
using Model = ProductManager.Models.Brand;

namespace ProductManager.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BrandController : ControllerBase
    {
        private readonly IBrandRepository _brandRepository;
        private IBrandService BrandService { get; }

        private readonly ILogger<BrandController> _logger;
        public BrandController(ILogger<BrandController> logger, IBrandService brandService, IBrandRepository brandRepository)
        {
            _logger = logger;
            BrandService = brandService;
            _brandRepository = brandRepository;
        }

        //[HttpGet]
        //public async Task<GetAllBrandResponse> GetAll(PaginationDTO? pagination) => await _brandRepository.GetAll(pagination.ToPaging());

        [HttpGet("Get/{name}")]
        public async Task<Model.Brand> Get(string name) => await _brandRepository.GetBrand(name);

        [HttpPost("Update")]
        public async Task<int> Update(UpdateBrand updateBrand)
        {
            return await _brandRepository.UpdateAsync(updateBrand);
        }

        [HttpPost("Create")]
        public async Task<int> Create(Brand brand)
        {
            return await _brandRepository.CreateAsync(brand.Name);
        }

        /// <summary>
        /// This endpont deletes a product form the database by ID
        /// </summary>
        /// <param name="brand"></param>
        /// <returns>Status for deletion</returns>
        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> Delete(Brand brand)
        {
            var data = await _brandRepository.DeleteAsync(brand.Name);
            return Ok(data);
        }
    }
}
