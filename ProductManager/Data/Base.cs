namespace ProductManager.Data
{
    public class Base
    {
        public DateTime CreatedAt { get; set; } 
        public DateTime LastModifiedAt { get; set;}  = DateTime.UtcNow;
    }
}
