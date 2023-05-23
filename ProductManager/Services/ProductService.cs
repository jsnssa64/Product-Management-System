using FluentValidation;
using FluentValidation.Results;
using LanguageExt.Common;
using ProductManager.Data;
using ProductManager.DTO.Product;
using ProductManager.Models.Product;
using ProductManager.Repository.Product;
using ProductManager.Validator;

namespace ProductManager.Services
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _productRepository;
        private readonly ProductValidator _productValidator;

        public ProductService(IProductRepository productRepository, ProductValidator productValidator)
        {
            _productRepository = productRepository;
            _productValidator = productValidator;
        }

        
        public async Task<AllProductsDto> GetProductsWithPagination(Paging paging)
        {
            var allProductDto = await _productRepository.GetProductsWithPagination(paging);

            return allProductDto;
        }

        public async Task<Product> GetProduct(Guid id)
        {
            var product = await _productRepository.GetProduct(id);
            return product;
        }

        public async Task<Result<bool>> CreateAsync(Product product)
        {
            ValidationResult validationResult = await _productValidator.ValidateAsync(product);

            if (!validationResult.IsValid)
            {
                var exceptions = new ValidationException(validationResult.Errors);
                return new Result<bool>(exceptions);
            }

            var allProducts = await _productRepository.GetAllProducts();


            if (allProducts.Any(p => p.Equals(product)))
            {
                var message = "Product Already Exist";
                return new Result<bool>(new ValidationException(message));
            }
            

            return await _productRepository.CreateAsync(product);
        }

        public async Task<Result<bool>> UpdateAsync(Product product)
        {

            ValidationResult validationResult = await _productValidator.ValidateAsync(product);

            if (!validationResult.IsValid)
            {
                var exceptions = new ValidationException(validationResult.Errors);
                return new Result<bool>(exceptions);
            }

            return await _productRepository.UpdateAsync(product);
        }

        public async Task<Result<bool>> DeleteAsync(Guid id)
        {
            var product = await _productRepository.GetProduct(id);

            if (product.DiscontinuedAt != null)
            {
                var message = "Product has already be discontinued";
                return new Result<bool>(new ValidationException(message));
            }

            product.DiscontinuedAt = product.Discontinue();

            return await _productRepository.UpdateAsync(product);
        }
    }
}
