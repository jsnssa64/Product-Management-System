using MediatR;
using ProductInventory.DomainModel;
using ProductInventory.Infastructure;
using ProductInventory.Requests.Product;
using ProductInventory.Responses.Product;

namespace ProductInventory.Commands
{
    public class CreateProductHandler : IRequestHandler<CreateProductRequest, CreateProductResponse>
    {
        private IRepository<Product> _repository;
        private IMediator _mediator;

        public CreateProductHandler(IRepository<Product> repository, IMediator mediator)
        {
            _repository = repository;
            _mediator = mediator;
        }

        public async Task<CreateProductResponse> Handle(CreateProductRequest request, CancellationToken cancellationToken)
        {
            var guid = Guid.NewGuid();
            var product = new Product(guid, request.ProductName);
            await _repository.SaveAsync(product);
            
            return new CreateProductResponse()
            {
                ProductId = product.Id
            };
        }
    }
}
