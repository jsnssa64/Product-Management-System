using System.ComponentModel.DataAnnotations;

namespace ProductManager.DTO.Brand
{
    public class UpdateBrand
    {
        [Required]
        public String ExistingName { get; set; }

        [Required]
        public String NewName { get; set; }
    }
}
