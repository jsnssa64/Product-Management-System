using FluentValidation.Results;
using ProductManager.Data;
using ProductManager.DTO.Product;
using ProductManager.Mapper;
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

        public async Task CreateAsync(CreateProduct createProduct)
        {
            AllProducts allProducts = new AllProducts();

            while (nextPage is null)
            {
                allProducts.Products = await _productRepository.GetAll();
                var productCount = allProducts.Products.Count(x => x.Title == createProduct.Title && x.Description == createProduct.Description);
                if (productCount > 0)
                {
                    return;
                }
                
                allProducts.Paging.NextPage();
            }
            products.Where
            product = product.ToProduct(createProduct);

            ValidationResult results = await _productValidator.ValidateAsync(product);

            if (results == null)
            {

            }

            await _productRepository.UpdateAsync(updateProduct);
        }

        public async Task UpdateAsync(UpdateProduct updateProduct)
        {
            Product product = await _productRepository.GetProduct(updateProduct.Id);
            product = product.ToProduct(updateProduct);

            ValidationResult results = await _productValidator.ValidateAsync(product);

            if (results == null)
            {

            }

            await _productRepository.UpdateAsync(updateProduct);
        }

        public async Task DeleteAsync(int id)
        {
            var product = await _productRepository.GetProduct(id);
            if (product == null)
            {
                //  do some exception 
                return;
            }

            UpdateProduct updateProduct = product.ToProductDTO();
            updateProduct.Discontinue();
            await _productRepository.UpdateAsync(product);
        }
    }
}
