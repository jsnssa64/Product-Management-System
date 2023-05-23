namespace ProductManager.DTO.Product
{
    public class AllProductsDto
    {
        public IEnumerable<Models.Product.Product> Products { get; set; } = new List<Models.Product.Product>();
        public int TotalRecordCount { get; set; }
    }
}
