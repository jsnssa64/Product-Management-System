using ProductManager.Data;
using ProductManager.Models.ValueObject;

namespace ProductManager.DTO.Product
{
    public class UpdateProduct
    {
        public UpdateProduct(Guid id, string? title, string? description, IEnumerable<Models.ValueObject.ProductType>? types, Unit? unit, IEnumerable<WeightInfo>? weightInfo)
        {
            Id = id;
            Title = title;
            Description = description;
            Types = types;
            Unit = unit;
            WeightInfo = weightInfo;
        }

        public Guid Id { get; }
        public string? Title { get; }
        public string? Description { get; }
        public IEnumerable<Models.ValueObject.ProductType>? Types { get; }
        public Unit? Unit { get; }
        public IEnumerable<WeightInfo>? WeightInfo { get; set; }
    }
}
