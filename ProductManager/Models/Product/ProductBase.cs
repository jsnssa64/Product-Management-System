using ProductManager.Data;

namespace ProductManager.Models.Product
{
    public abstract class ProductBase : DataEntity
    {

        protected ProductBase()
        {
            Fields.Add("Id");
            Fields.Add("DiscontinuedAt");
        }
    
        public Guid Id { get; set; }  
        public DateTime? DiscontinuedAt { get; set; }

        public DateTime? Discontinue()
        {
            return DiscontinuedAt ?? DateTime.UtcNow;
        }
    }
}
