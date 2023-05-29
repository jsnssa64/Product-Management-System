using ProductManager.Data;

namespace ProductManager.Response.Product
{
    public class GetAllProductResponse
    {
        public GetAllProductResponse(IEnumerable<ProductBasicResponse> products, Paging pagination)
        {
            Products = products;
            Pagination = pagination;
        }

        public IEnumerable<ProductBasicResponse> Products { get; set; }
        public Paging Pagination { get; set; }
    }
}
