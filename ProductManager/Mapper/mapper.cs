using ProductManager.DTO.Product;
using ProductManager.Models.Product;

namespace ProductManager.Mapper
{
    public static class Mapper
    {
        public static Product ToProduct(this Product product, UpdateProduct updateProduct)
        {
            return new Product(product.Id)
            {
                Title = updateProduct.Title ?? product.Title, 
                Description = updateProduct.Description ?? product.Description, 
                Types = updateProduct.Types ?? product.Types, 
                Unit = updateProduct.Unit ?? product.Unit, 
                WeightInfo = updateProduct.WeightInfo ?? product.WeightInfo
            };
        }

        public static Product ToProduct(this Product product, CreateProduct updateProduct)
        {
            return new Product(product.Id)
            {
                Title = updateProduct.Title,
                Description = updateProduct.Description,
                Types = updateProduct.Types,
                Unit = updateProduct.Unit,
                WeightInfo = updateProduct.WeightInfo
            };
        }
    }
}
