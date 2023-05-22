using ProductManager.Data;
using ProductManager.DTO.Product.Other;
using ProductManager.DTO.Product.Type;
using ProductManager.Models.ValueObject;

namespace ProductManager.DTO.Product
{
    public class UpdateProductDto
    {
        public Guid Id { get; set; }
        public string? Title { get; set; }
        public string? Description { get; set; }
        public IEnumerable<ProductTypeDto>? Types { get; set; }
        public UnitDto? Unit { get; set; }
        public CostDto? Cost { get; set; }
        public WeightInfoDto? WeightInfo { get; set; }
    }
}
