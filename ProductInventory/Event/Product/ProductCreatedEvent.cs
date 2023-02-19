
using MediatR;

namespace ProductInventory.Event
{
    public class ProductCreatedEvent : Shared.IEvent, IRequest<Unit>
    {
        public ProductCreatedEvent(Guid id, string name)
        {
            Id = id;
            Name = name;
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        public int Quantity { get; set; } = 0;
        public DateTime ModifiedAt { get; set; } = DateTime.Now;
    }
}
