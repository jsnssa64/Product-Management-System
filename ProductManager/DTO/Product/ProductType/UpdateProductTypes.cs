using System.ComponentModel.DataAnnotations;
using model = ProductManager.Models.ValueObject.Catergory.ProductType;

namespace ProductManager.DTO.Product.ProductType
{
    public class UpdateProductTypes
    {
        [Required]
        public Guid ProductId { get; set; }
        public IEnumerable<model>? ProductTypes { get; set; }
    }
}
