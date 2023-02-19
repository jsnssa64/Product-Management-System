using MediatR;
using ProductInventory.Responses.Product;

namespace ProductInventory.Requests.Product
{
    public class AddProductRequest : IRequest<AddProductResponse>
    {
        public Guid ProductId { get; set; }
        public int Quantity { get; set; }
            
    }
}
