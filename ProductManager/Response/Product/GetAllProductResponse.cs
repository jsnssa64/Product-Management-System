using ProductManager.Data;

namespace ProductManager.Result.Product
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
