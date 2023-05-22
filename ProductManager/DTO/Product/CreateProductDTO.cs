using ProductManager.Data;
using ProductManager.Models.ValueObject;

namespace ProductManager.DTO.Product
{
    public class CreateProductDto
    {
        public CreateProductDto(string title, string description, IEnumerable<ProductType> types, Unit unit, WeightInfo weightInfo)
        {
            Title = title;
            Description = description;
            Types = types;
            Unit = unit;
            WeightInfo = weightInfo;
        }
        
        public string Title { get; }
        public string Description { get; }
        public IEnumerable<ProductType> Types { get; }
        public Unit Unit { get; }
        public WeightInfo WeightInfo { get; }
    }
}
