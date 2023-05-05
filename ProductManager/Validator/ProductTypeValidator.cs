using FluentValidation;
using ProductManager.Models.ValueObject;

namespace ProductManager.Validator
{
    public class ProductTypeValidator : AbstractValidator<ProductType>
    {
        public ProductTypeValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Please specify a Name");
        }
    }
}
