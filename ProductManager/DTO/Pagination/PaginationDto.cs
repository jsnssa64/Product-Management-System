namespace ProductManager.DTO.Pagination
{
    public class PaginationDTO
    {
        public int Page { get; set; }
        public int MaxItemsPerPage { get; set; } = 20;
    }
}
