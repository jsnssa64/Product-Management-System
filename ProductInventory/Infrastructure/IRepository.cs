using ProductInventory.Core.Framework;

namespace ProductInventory.Infastructure
{
    public interface IRepository<T> where T : AggregateRoot
    {
        public Task SaveAsync(T entity);
        public Task<T> LoadAsync(Guid aggregateId);
    }
}
