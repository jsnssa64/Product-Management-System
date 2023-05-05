using System.ComponentModel.DataAnnotations;

namespace ProductManager.DTO.Brand
{
    public class Brand
    {
        [Required]
        public String Name { get; set; }
    }
}
