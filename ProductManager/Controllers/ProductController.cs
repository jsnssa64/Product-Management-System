using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProductManager.DTO.Brand;
using ProductManager.DTO.Product;
using ProductManager.Models;
using ProductManager.Models.Brand;
using ProductManager.Repository;
using ProductManager.Repository.Product;
using ProductManager.Services;
using Brand = ProductManager.Models.Brand.Brand;

namespace ProductManager.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductRepository _productRepository;
        private readonly ProductService _productService;

        private readonly ILogger<ProductController> _logger;
        public ProductController(ILogger<ProductController> logger, ProductService productService, IProductRepository productRepository)
        {
            _logger = logger;
            _productService = productService;
            _productRepository = productRepository;
        }

        [HttpGet]
        public async Task<IReadOnlyList<Models.Brand.Brand>> Get() => await _productRepository.GetAll();

        [HttpGet("GetByProductId/{id}")]
        public async Task<Models.Brand.Brand> GetByProductId(Guid Id) => await _productRepository.GetProduct(Id);

        [HttpPost("Update")]
        public async Task<int> Update([FromBody]UpdateProduct product)
        {
            return await _productService.UpdateAsync(product);
        }

        [HttpPost("Create/{Name}")]
        public async Task<int> Create(CreateProduct product)
        {
            return await _productService.CreateAsync(product);
        }
        

        /// <summary>
        /// This endpont checks if a product has been discontinued
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Status for deletion</returns>
        [HttpDelete]
        public async Task<IActionResult> Delete(Guid id)
        {
            var data = await _productService.DeleteAsync(id);
            return Ok(data);
        }
    }
}
