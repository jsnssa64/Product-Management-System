using ProductManager.Data;

namespace ProductManager.Response.Brand
{
    public class GetAllBrandResponse
    {
        public GetAllBrandResponse(IEnumerable<BrandBasicResponse> brands, Paging pagination)
        {
            Brands = brands;
            Pagination = pagination;
        }

        public IEnumerable<BrandBasicResponse> Brands { get; set; }
        public Paging Pagination { get; set; }
    }
}
