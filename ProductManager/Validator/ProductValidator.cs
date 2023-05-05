using FluentValidation;
using ProductManager.Models.Product;

namespace ProductManager.Validator
{
    public class ProductValidator : AbstractValidator<Product>
    {
        public ProductValidator()
        {
            RuleFor(x => x.Title).NotEmpty().WithMessage("Please specify a Title");
            RuleFor(x => x.Description).NotEmpty().WithMessage("Please specify a Description");
            RuleForEach(x => x.Types).SetValidator(new ProductTypeValidator());
            RuleFor(x => x.Unit).SetValidator(new UnitValidator());
            RuleFor(x => x.WeightInfo).SetValidator(new WeightValidator());
        }
    }
}
