using ProductInventory.Shared;

namespace ProductInventory.Infrastructure.Publisher
{
    public interface IEventPublisher
    {
        void Publish<T> (T @event) where T : IEvent;
    }
}
