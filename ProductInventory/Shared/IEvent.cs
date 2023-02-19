namespace ProductInventory.Shared
{
    public interface IEvent
    {
        public DateTime ModifiedAt { get; set; }
    }
}
