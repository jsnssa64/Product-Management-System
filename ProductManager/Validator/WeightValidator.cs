using FluentValidation;
using ProductManager.Models.ValueObject;

namespace ProductManager.Validator
{
    public class WeightValidator : AbstractValidator<WeightInfo>
    {
        public WeightValidator()
        {
            RuleFor(x => x.Type).MinimumLength(0).MaximumLength(256).NotEmpty().WithMessage("Please specify weight type");
            RuleFor(x => x.Weight).GreaterThan(0).NotEmpty().WithMessage(weightInfo => $"Please specify total {weightInfo.Type} weight");
        }
    }
}
