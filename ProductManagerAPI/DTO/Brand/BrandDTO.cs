using System.ComponentModel.DataAnnotations;

namespace ProductManager.DTO.Brand
{
    public class BrandDTO
    {
        [Required]
        public String Name { get; set; }
    }
}
