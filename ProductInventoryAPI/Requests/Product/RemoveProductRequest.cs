using MediatR;
using ProductInventory.Responses.Product;

namespace ProductInventory.Requests.Product
{
    public class RemoveProductRequest : IRequest<RemoveProductResponse>
    {
        public Guid ProductId { get; set; }
        public int Quantity { get; set; }
            
    }
}
