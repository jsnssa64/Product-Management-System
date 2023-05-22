using ProductManager.Models.ValueObject;

namespace ProductManager.Models.Product
{
    public class Product: ProductBase
    {
        public string Title { get; set; }
        public string Description { get; set; }

        public IEnumerable<ProductType> Types { get; set; }

        public WeightInfo WeightInfo { get; set; }
        
        public Unit Unit { get; set; }
        
        public Cost Cost { get; set; }

        protected override void AddFields()
        {
            Fields.Add("Title");
            Fields.Add("Description");
            Fields.Add("Types");
            Fields.Add("WeightInfo");
            Fields.Add("Unit");
            Fields.Add("Cost");
        }

        public override bool Equals(object? obj)
        {
            // If the passed object is null
            if (obj == null)
            {
                return false;
            }
            if (!(obj is Product product))
            {
                return false;
            }
            return (this.Title == product.Title
                   && this.Description == product.Description
                       && this.WeightInfo == product.WeightInfo
                        && (this.Types.ToList().All(product.Types.Contains) && product.Types.All(this.Types.Contains))
                           && this.Unit == product.Unit
                               && this.Cost == product.Cost);
        }
        //Overriding the GetHashCode method
        //GetHashCode method generates hashcode for the current object
        public override int GetHashCode()
        {
            //Performing BIT wise OR Operation on the generated hashcode values
            //If the corresponding bits are different, it gives 1.
            //If the corresponding bits are the same, it gives 0.
            return Title.GetHashCode() ^ Description.GetHashCode();
        }
    }
}
