using ProductInventory.Shared;

namespace ProductInventory.Infrastructure.Publisher
{

    public class FakeBus : IEventPublisher
    {
        private Dictionary<Type, List<Action<IEvent>>?> _routes;

        public void Publish<T>(T @event) where T : IEvent
        {
            List<Action<IEvent>>? handlers;

            if (!_routes.TryGetValue(@event.GetType(), out handlers)) return;

            foreach (var handler in handlers)
            {
                Task.Run(() => handler(@event));
            }
        }
    }
}
