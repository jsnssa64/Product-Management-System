using System.Collections;

namespace ProductManager.Data
{
    public abstract class PagingEntity<T> where T : class  
    {

        public int? CurrentPageIndex { get; set; }
        public int MaxItemsPerPage { get; set; }
        public int TotalRecords { get; set; }
        public int TotalPages { get; set; }
        
        public bool HasPreviousPage => CurrentPageIndex > 1;

        public bool HasNextPage => CurrentPageIndex < TotalPages;


        public void Next() => CurrentPageIndex++;
        public int? Previous() => CurrentPageIndex--;

        public Paging GetPaging()
        {
            return new Paging()
            {
                MaxItemsPerPage = MaxItemsPerPage,
                CurrentPage = CurrentPageIndex
            };
        }
    }
}
