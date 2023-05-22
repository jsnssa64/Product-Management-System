using FluentValidation;
using Microsoft.AspNetCore.Mvc;
using ProductManager.DTO.Pagination;
using ProductManager.DTO.Product;
using ProductManager.Extensions;
using ProductManager.Mapper;
using ProductManager.Repository.Product;
using ProductManager.Result.Product;
using ProductManager.Services;

namespace ProductManager.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly ProductService _productService;

        private readonly ILogger<ProductController> _logger;
        public ProductController(ILogger<ProductController> logger, ProductService productService)
        {
            _logger = logger;
            _productService = productService;
        }

        [HttpGet]
        public async Task<GetAllProductResponse> GetAll(PaginationDTO? pagination)
        {
            var paging = pagination.ToPaging();
            var allProductsDto = await _productService.GetProductsWithPagination(paging);
            return allProductsDto.ToResponse(paging);
        }

        [HttpGet("GetByProductId/{id}")]
        public async Task<ProductDetailsResponse> GetByProductId(Guid Id)
        {
            var product = await _productService.GetProduct(Id);
            return product.ToResponse();
        } 

        [HttpPost("Update")]
        public async Task<IActionResult> Update([FromBody]UpdateProductDto updateProductDto)
        {

            var getProduct = await _productService.GetProduct(updateProductDto.Id);
            var product = updateProductDto.ToProduct(getProduct);
            var result = await _productService.UpdateAsync(product);

            return result.Match<IActionResult>(p =>
                {
                    var productResponse = product.ToResponse();
                    return Ok(productResponse);
                },
            exception =>
            {
                if (exception is ValidationException validationException)
                {
                    return BadRequest(validationException.ToProblemDetails());
                }

                return StatusCode(500);
            });
        }

        [HttpPost("Create/{Name}")]
        public async Task<IActionResult> Create(CreateProductDto createProductDto)
        {
            var product = createProductDto.ToProduct();
            var result = await _productService.CreateAsync(product);


            return result.Match<IActionResult>(p =>
                {
                    var productResponse = product.ToResponse();
                    return CreatedAtAction("GetByProductId", new { productResponse.Id }, productResponse);
                },
                exception =>
                {
                    if (exception is ValidationException validationException)
                    {
                        return BadRequest(validationException.ToProblemDetails());
                    }

                    return StatusCode(500);
                });
        }
        

        /// <summary>
        /// This endpont checks if a product has been discontinued
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Status for deletion</returns>
        [HttpDelete]
        public async Task<IActionResult> Delete(Guid id)
        {
            await _productService.DeleteAsync(id);
            return Ok();
        }
    }
}
