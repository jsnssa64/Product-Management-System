using System.ComponentModel.DataAnnotations;
using model = ProductManager.Models.Product.ProductType;

namespace ProductManager.DTO.Product.ProductType
{
    public class UpdateProductTypesDTO
    {
        [Required]
        public Guid ProductId { get; set; }
        public IEnumerable<model.ProductType>? ProductTypes { get; set; }
    }
}
