using ProductManager.Data;

namespace ProductManager.Models.Product.Behavioural
{
    public class AllProducts : PagingEntity<Product>
    {
        public IEnumerable<Product> Items { get; set; }
    }
}
