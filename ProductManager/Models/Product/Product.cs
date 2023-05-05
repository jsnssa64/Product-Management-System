using ProductManager.Data;
using ProductManager.Models.ValueObject;

namespace ProductManager.Models.Product
{
    public class Product: ProductBase
    {
        public Product(Guid id) : base(id)
        { }

        public string Title { get; set; }
        
        public string Description { get; set; }
        
        /*
         * List of Descriptions for the product
         */
        public IEnumerable<ProductType> Types { get; set; }

        public WeightInfo WeightInfo { get; set; }
        
        public Unit Unit { get; set; }

        //  External Get Cost
        public Cost Cost { get; set; }
    }
}
