using System.Collections;

namespace ProductManager.Data
{
    public abstract class PagingEntity<T> where T : class  
    {
        public abstract IEnumerable<T> Items { get; set; }

        private uint? CurrentPageIndex { get; set; }
        private uint? NextPageIndex { get; set; }
        private uint? PreviousPageIndex { get; set; }
        private int _pageCount;
        private int _itemCount;
        
        public int MaxItemsPerPage { get; set; }


        public void SetPageCount()
        {
            _itemCount = Items.Count();
            _pageCount = MaxItemsPerPage % _itemCount;
            ResetPage();
        }

        private void ResetPage()
        {
            CurrentPageIndex = 1;
            PreviousPageIndex = null;

            switch (_pageCount)
            {
                case > 1:
                    NextPageIndex = CurrentPageIndex++;
                    PreviousPageIndex = null;
                    break;
                case 1:
                    NextPageIndex = null;
                    break;
                default:
                    CurrentPageIndex = null;
                    break;
            }
        }

        public void NextPage()
        {
            if (_itemCount != Items.Count())
            {
                SetPageCount();
                return;
            }

            CurrentPageIndex++;

            if (CurrentPageIndex >= _pageCount)
            {
                CurrentPageIndex = (uint?)_pageCount;
                NextPageIndex = null;
                PreviousPageIndex = (uint?)_pageCount - 1;
                return;
            }

            NextPageIndex++;
            PreviousPageIndex++;
        }
        public void PreviousPage()
        {
            if (_itemCount != Items.Count())
            {
                SetPageCount();
                return;
            }

            CurrentPageIndex--;

            if (CurrentPageIndex <= 0)
            {
                CurrentPageIndex = 1;
                NextPageIndex = 2;
                PreviousPageIndex = null;
                return;
            }

            NextPageIndex--;
            PreviousPageIndex--;
        }
    }
}
