using EventStore.ClientAPI;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProductInventory.DomainModel;
using ProductInventory.Infastructure;
using ProductInventory.Requests.Product;
using ProductInventory.Responses.Product;

namespace ProductInventory.Commands
{
    public class RemoveProductHandler : IRequestHandler<RemoveProductRequest, RemoveProductResponse>
    {
        private IRepository<Product> _repository { get; set; }

        public RemoveProductHandler(IRepository<Product> repository)
        {
            _repository = repository;
        }

        public async Task<RemoveProductResponse> Handle(RemoveProductRequest request, CancellationToken cancellationToken)
        {
            var product = await _repository.LoadAsync(request.ProductId);

            if (product == null)
                throw new Exception("Product Not Found");

            product.Remove(request.Quantity);
            await _repository.SaveAsync(product);

            return new RemoveProductResponse()
            {
                ProductId = request.ProductId
            };

            //  return product.;
        }
    }
}
