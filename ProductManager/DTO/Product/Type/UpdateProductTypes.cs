using System.ComponentModel.DataAnnotations;
using model = ProductManager.Models.ValueObject;

namespace ProductManager.DTO.Product.Type
{
    public class UpdateProductTypes
    {
        [Required]
        public Guid ProductId { get; set; }
        public IEnumerable<model.Catergory>? ProductTypes { get; set; }
    }
}
