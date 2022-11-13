using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProductManager.DTO.Brand;
using ProductManager.Models;
using ProductManager.Models.Brand;
using ProductManager.Repository;
using ProductManager.Repository.Brand;
using ProductManager.Services;

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
        public async Task<IReadOnlyList<Brand>> Get() => await _brandRepository.GetAll();

        [HttpGet("GetByProductId/{id}")]
        public async Task<Brand> GetByProductId(int Id) => await _brandRepository.GetBrandById(Id);

        [HttpPost("Update")]
        public async Task<int> Update([FromBody]UpdateBrandDTO updateBrandDTO)
        {
            return await _brandRepository.UpdateAsync(updateBrandDTO);
        }

        [HttpPost("Create/{Name}")]
        public async Task<int> Create(String Name)
        {
            return await _brandRepository.CreateAsync(Name);
        }

        /// <summary>
        /// This endpont deletes a product form the database by ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Status for deletion</returns>
        [HttpDelete]
        public async Task<IActionResult> Delete(String Name)
        {
            var data = await _brandRepository.DeleteAsync(Name);
            return Ok(data);
        }
    }
}
