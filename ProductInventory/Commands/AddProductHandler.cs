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
    public class AddProductHandler : IRequestHandler<AddProductRequest, AddProductResponse>
    {
        private IRepository<Product> _repository { get; set; }

        public AddProductHandler(IRepository<Product> repository)
        {
            _repository = repository;
        }

        public async Task<AddProductResponse> Handle(AddProductRequest request, CancellationToken cancellationToken)
        {
            var product = await _repository.LoadAsync(request.ProductId);

            if (product == null)
                throw new Exception("Product Not Found");

            product.Add(request.Quantity);
            await _repository.SaveAsync(product);

            return new AddProductResponse()
            {
                ProductId = request.ProductId
            };

            //  return product.;
        }
    }
}
