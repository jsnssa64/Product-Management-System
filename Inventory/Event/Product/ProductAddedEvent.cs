using MediatR;
using ProductInventory.Shared;

namespace ProductInventory.Event
{
    public class ProductAddedEvent : Shared.IEvent, IRequest<Unit>
    {
        public ProductAddedEvent(Guid id, int quantity)
        {
            Id = id;
            Quantity = quantity;
        }

        public Guid Id { get; set; }
        public int Quantity { get; set; }
        public DateTime Created { get; set; } = DateTime.Now;
        public DateTime ModifiedAt { get; set; } = DateTime.Now;
    }
}
