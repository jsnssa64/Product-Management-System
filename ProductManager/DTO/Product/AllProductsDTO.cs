namespace ProductManager.DTO.Product
{
    public class AllProductsDto
    {
        public IEnumerable<Models.Product.Product> Products { get; set; }
        public int TotalRecordCount { get; set; }
    }
}
