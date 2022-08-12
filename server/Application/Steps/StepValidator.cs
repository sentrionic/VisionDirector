using FluentValidation;

namespace Application.Steps;

/// <summary>
///     Validates a StepDto
/// </summary>
public class StepValidator : AbstractValidator<CreateStepDto>
{
    public StepValidator()
    {
        RuleFor(x => x.Name).NotEmpty().MaximumLength(StepConstants.MaxNameLength);
        RuleFor(x => x.Annotation).MaximumLength(StepConstants.MaxAnnotationLength).When(x => x.Annotation != null);
        RuleFor(x => x.MediaFile!.Length).LessThanOrEqualTo(StepConstants.MaxFileSize).WithMessage("File is too big")
            .When(x => x.MediaFile != null);
        RuleFor(x => x.MediaFile!.ContentType).Must(x => x.Contains("video") || x.Contains("image")).When(x => x.MediaFile != null);
        RuleFor(x => x.AudioFile!.ContentType).Must(x => x.Contains("audio")).When(x => x.AudioFile != null);
        RuleFor(x => x.Duration).GreaterThanOrEqualTo(StepConstants.MinDuration);
    }
}
