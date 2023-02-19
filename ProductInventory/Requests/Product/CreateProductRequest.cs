using MediatR;
using ProductInventory.Responses.Product;

namespace ProductInventory.Requests.Product
{
    public class CreateProductRequest : IRequest<CreateProductResponse>
    {
        public string ProductName { get; set; }
            
    }
}
