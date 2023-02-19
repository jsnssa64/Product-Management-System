using System.Text;
using EventStore.ClientAPI;
using Newtonsoft.Json;
using ProductInventory.Core.Framework;

namespace ProductInventory.Infastructure
{
    public class EventStoreRepository<T> : IRepository<T> where T : AggregateRoot, new()
    {
        private readonly IEventStoreConnection _eventStore;

        public EventStoreRepository(IEventStoreConnection eventStore)
        {
            _eventStore = eventStore;
        }

        public async Task SaveAsync(T aggregate)
        {
            if(aggregate == null)
                throw new ArgumentNullException(nameof(aggregate));

            var eventDatas = aggregate.GetUncommittedChanges().Select(@event => new EventData(Guid.NewGuid(),
                @event.GetType().Name,
                true,
                Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(@event)),
                Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(@event.GetType().FullName)))).ToArray();
            
            if (!eventDatas.Any())
            {
                return;
            }

            var streamName = GetStreamName(aggregate, aggregate.Id);

            var result = await _eventStore.AppendToStreamAsync(streamName, ExpectedVersion.Any, eventDatas);

            aggregate.MarkChangesAsCommitted();
        }

        public async Task<T> LoadAsync(Guid aggregateId)
        {
            if (aggregateId == Guid.Empty)
                throw new ArgumentException("Value cannot be null or whitespace.", nameof(aggregateId));

            var aggregate = new T();
            var streamName = GetStreamName(aggregate, aggregateId);

            var nextPageStart = 0L;

            do
            {
                var page = await _eventStore.ReadStreamEventsForwardAsync(
                    streamName, nextPageStart, 4096, false);

                if (page.Events.Length > 0)
                {

                    aggregate.LoadsFromHistory(
                        page.Events.Last().Event.EventNumber,
                        page.Events.Select(@event =>
                            JsonConvert.DeserializeObject<Shared.IEvent>(
                                Encoding.UTF8.GetString(@event.OriginalEvent.Data))));
                    //,Type.GetType(Encoding.UTF8.GetString(@event.OriginalEvent.Metadata
                }

                nextPageStart = !page.IsEndOfStream ? page.NextEventNumber : -1;
            } while (nextPageStart != -1);

            return aggregate;
        }

        private string GetStreamName(T type, Guid aggregateId) => $"{type?.GetType().Name}-{aggregateId}";
    }
}
