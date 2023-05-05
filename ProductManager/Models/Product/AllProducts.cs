using ProductManager.Data;

namespace ProductManager.Models.Product
{
    public class AllProducts: PagingEntity<Product>
    {
        public AllProducts(IEnumerable<Product> items)
        {
            Items = items;
        }

        public sealed override IEnumerable<Product> Items { get; set; }
    }
}
