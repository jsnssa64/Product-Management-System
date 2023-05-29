using ProductManager.Models.ValueObject;

namespace ProductManager.Response.Product
{
    public record ProductDetailsResponse : ProductBasicResponse
    {
        public IEnumerable<ProductTypeResponse> Types { get; set; }
        public WeightInfo WeightInfo { get; set; }
        public Unit Unit { get; set; }
        public Cost Cost { get; set; }
        public DateTime? DiscontinuedAt { get; set; }
    }
}
