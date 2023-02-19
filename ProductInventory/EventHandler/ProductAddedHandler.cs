using MediatR;
using ProductInventory.Event;

namespace ProductInventory.EventHandler
{
    public class ProductAddedHandler : IRequestHandler<ProductAddedEvent>
    {
        public async Task<Unit> Handle(ProductAddedEvent @event, CancellationToken cancellationToken)
        {

            //var model = FakeReadDatabase.Products.Find(product => product.Id == @event.Id);
            //model.Quantity += @event.Quantity;

            return await Task.FromResult(Unit.Value);
        }
    }
}
