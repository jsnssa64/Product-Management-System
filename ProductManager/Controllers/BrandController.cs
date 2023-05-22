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
        private BrandService BrandService { get; set; }

        private readonly ILogger<BrandController> _logger;
        public BrandController(ILogger<BrandController> logger, BrandService brandService, IBrandRepository brandRepository)
        {
            _logger = logger;
            BrandService = brandService;
            _brandRepository = brandRepository;
        }

        [HttpGet]
        public async Task<IActionResult<>> Get(GetAllBrand brand) => await _brandRepository.GetAll(paging);

        [HttpGet("GetBrand/{name}")]
        public async Task<Model.Brand> GetByBrand(string name) => await _brandRepository.GetBrand(name);

        [HttpPost("Update")]
        public async Task<int> Update([FromBody]UpdateBrand updateBrand)
        {
            return await _brandRepository.UpdateAsync(updateBrand);
        }

        [HttpPost("Create/{name}")]
        public async Task<int> Create(Brand brand)
        {
            return await _brandRepository.CreateAsync(brand.Name);
        }

        /// <summary>
        /// This endpont deletes a product form the database by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Status for deletion</returns>
        [HttpDelete]
        public async Task<IActionResult> Delete(Brand brand)
        {
            var data = await _brandRepository.DeleteAsync(brand.Name);
            return Ok(data);
        }
    }
}
