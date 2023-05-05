using MediatR;
using ProductInventory.Shared;

namespace ProductInventory.Event
{
    public class ProductRemovedEvent : Shared.IEvent, IRequest<Unit>
    {
        public ProductRemovedEvent(Guid id, int quantity)
        {
            Id = id;
            Quantity = quantity;
        }

        public Guid Id { get; set; }
        public int Quantity { get; set; }
        public DateTime ModifiedAt { get; set; } = DateTime.Now;
    }
}
