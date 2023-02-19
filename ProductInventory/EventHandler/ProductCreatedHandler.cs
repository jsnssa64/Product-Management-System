using MediatR;
using ProductInventory.Event;

namespace ProductInventory.EventHandler
{
    public class ProductCreatedHandler : IRequestHandler<ProductCreatedEvent>
    {
        public async Task<Unit> Handle(ProductCreatedEvent @event, CancellationToken cancellationToken)
        {
            //await Task.CompletedTask;

            //var model = new ProductViewModel
            //{
            //    Id = @event.AggregateId,
            //    Title = @event.Title
            //};

            //var model = FakeReadDatabase.Products.Add(model);

            //model.Title = @event;

            return await Task.FromResult(Unit.Value);
        }
    }
}
