using ProductManager.Models.ValueObject;
using ProductManager.Response.Product;

namespace ProductManager.Result.Product
{
    public class ProductDetailsResponse : ProductBasicResponse
    {

        public IEnumerable<ProductTypeResponse> Types { get; set; }
        public WeightInfo WeightInfo { get; set; }
        public Unit Unit { get; set; }
        public Cost Cost { get; set; }
        public DateTime? DiscontinuedAt { get; set; }

    }
}
