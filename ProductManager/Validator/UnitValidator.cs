using FluentValidation;
using ProductManager.Models.ValueObject;

namespace ProductManager.Validator
{
    public class UnitValidator : AbstractValidator<Unit>
    {
        public UnitValidator()
        {
            RuleFor(x => x.UnitName).MinimumLength(0).MaximumLength(256).NotEmpty().WithMessage("Please specify ");
            RuleFor(x => x.Units).GreaterThan(0).NotNull().WithMessage("Please specify number of units");
        }
    }
}
