using ProductManager.DTO.Product.Type;
using ProductManager.Models.ValueObject;

namespace ProductManager.DTO.Product
{
    public class ProductDetailsDto : BasicProductDto
    {
        public IEnumerable<ProductTypeDto> Types { get; set; }

        public WeightInfo WeightInfo { get; set; }

        public Unit Unit { get; set; }
        
        public Cost Cost { get; set; }

        public DateTime DiscontinuedAt { get; set; }
    }
}
