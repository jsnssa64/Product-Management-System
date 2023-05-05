using System.Collections;
using System.Data;
using System.Reflection.Metadata.Ecma335;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace ProductManager.Data
{
    public class Paging : DataEntity
    {
        public int Page { get; set; } = 1;
        public int MaxItemsPerPage { get; set; } = 20;

        protected override List<string> Fields { get; set; } = new()
        {
            "Page",
            "MaxItemsPerPage"
        };
    }
}
