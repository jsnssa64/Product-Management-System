using System.ComponentModel.DataAnnotations;

namespace ProductManager.DTO.Brand
{
    public class UpdateBrandDTO
    {
        [Required]
        public String OriginName { get; set; }

        [Required]
        public String NewName { get; set; }
    }
}
