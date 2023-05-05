namespace ProductInventory.Shared
{
    public interface ICommand
    {
        public DateTime ModifiedAt { get; set; }
    }
}
