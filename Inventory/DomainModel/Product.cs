using Inventory.Core.Framework;
using ProductInventory.Core.Exceptions;
using ProductInventory.Event;
using ProductInventory.Shared;

namespace ProductInventory.DomainModel
{
    public class Product : AggregateRoot
    {
        public string Name { get; set; }
        public int Quantity { get; set; }
        
        public Product(Guid id, string name)
        {
            if (Version >= 0)
            {
                throw new ProductAlreadyCreateException();
            }
            
            ApplyChange(new ProductCreatedEvent(id, name));
        }
        
        protected override void When(object @event)
        {
            switch (@event)
            {
                case ProductCreatedEvent eventItem: 
                    OnCreated(eventItem); 
                    break;
                case ProductAddedEvent eventItem: 
                    OnAdded(eventItem); 
                    break;
                case ProductRemovedEvent eventItem: 
                    OnRemoved(eventItem); 
                    break;
            }
        }

        #region Action Logic

        public void Add(int quantity)
        {
            if (Version == -1)
            {
                //  Test
                throw new ProductNotFoundException();
            }

            ApplyChange(new ProductAddedEvent
            (
                Id = Id,
                Quantity = quantity
            ));
        }

        public void Remove(int quantity)
        {
            if (Version == -1)
            {
                throw new ProductNotFoundException();
            }

            if (this.Quantity <= 0)
            {
                throw new ProductAlreadyEmptyException();
            }
            
            ApplyChange(new ProductRemovedEvent
            (
                Id = Id,
                Quantity = quantity
            ));
        }

        #endregion

        #region Event Handler / Move

        //  Logic -> Apply -> When -> EventHandler -> AddToList 
        protected void OnCreated(ProductCreatedEvent @event)
        {
            Id = @event.Id;
            Name = @event.Name;
            Quantity = @event.Quantity;
        }
        
        public void OnAdded(ProductAddedEvent @event)
        {
            Quantity += @event.Quantity;
        }

        public void OnRemoved(ProductRemovedEvent @event)
        {
            Quantity -= @event.Quantity;
        }

        #endregion

    }
}
