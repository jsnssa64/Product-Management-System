namespace ProductManager.Data
{
    public class Paging : DataEntity
    {
        public int CurrentPage { get; set; } = 1;
        public int MaxItemsPerPage { get; set; } = 20;
        public int TotalRecords { get; set; }

        private int? _nextPage;
        private int? _previousPage;
        

        public void SetState()
        {
            var total = CurrentPage * MaxItemsPerPage;

            _previousPage = CurrentPage == 1 ? null : CurrentPage--;
            _nextPage = total >= TotalRecords ? null : CurrentPage++;
        }

        protected override void AddFields()
        {
            Fields.Add("CurrentPage");
            Fields.Add("MaxItemsPerPage");
        }
    }
}
