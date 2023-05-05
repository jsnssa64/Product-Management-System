using MediatR;
using ProductInventory.Event;

namespace ProductInventory.EventHandler
{
    public class ProductRemovedHandler : IRequestHandler<ProductRemovedEvent>
    {
        public async Task<Unit> Handle(ProductRemovedEvent @event, CancellationToken cancellationToken)
        {
            //await Task.CompletedTask;

            //var model = FakeReadDatabase.Products.Find(product => product.Id == @event.Id);

            //model.Quantity -= @event.Quantity;

            return await Task.FromResult(Unit.Value);
        }
    }
}
