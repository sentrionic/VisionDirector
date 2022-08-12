using Application.Steps;
using FluentValidation;

namespace Application.Templates;

/// <summary>
///     Validates a TemplateStepResponse
/// </summary>
public class TemplateStepValidator : AbstractValidator<TemplateStepDto>
{
    public TemplateStepValidator()
    {
        RuleFor(x => x.Name).NotEmpty().MaximumLength(StepConstants.MaxNameLength);
        RuleFor(x => x.Position).GreaterThanOrEqualTo(0);
        RuleFor(x => x.Duration).GreaterThanOrEqualTo(StepConstants.MinDuration);
        RuleFor(x => x.Media!.Length).LessThanOrEqualTo(StepConstants.MaxFileSize).WithMessage("File is too big")
            .When(x => x.Media != null);
        RuleFor(x => x.Media!.ContentType).Must(x => x.Contains("video") || x.Contains("image")).When(x => x.Media != null);
    }
}
