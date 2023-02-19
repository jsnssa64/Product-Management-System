using ProductInventory.Shared;

namespace ProductInventory.Core.Framework
{

    public abstract class AggregateRoot
    {
        readonly IList<Shared.IEvent> _changes = new List<Shared.IEvent>();
        public Guid Id { get; protected set; } = Guid.Empty;
        public long Version { get; private set; } = -1;

        public IEnumerable<Shared.IEvent> GetUncommittedChanges()
        {
            return _changes;
        }

        public void MarkChangesAsCommitted()
        {
            _changes.Clear();
        }

        public void LoadsFromHistory(long version, IEnumerable<Shared.IEvent> history)
        {
            Version = version;
            foreach (var e in history) ApplyChange(e, false);
        }

        //  Public to access internal ApplyChanges
        protected void ApplyChange(Shared.IEvent @event)
        {
            ApplyChange(@event, true);
        }

        // push atomic aggregate changes to local history for further processing (EventStore.SaveEvents)
        private void ApplyChange(Shared.IEvent @event, bool isNew)
        {
            //  Apply certain event handler actions depending on event
            this.When(@event);
            if (isNew) _changes.Add(@event);
        }


        protected abstract void When(object @event);
    }
}
