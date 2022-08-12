using System.ComponentModel;
using System.Text.Json.Serialization;
using Application.Core;
using Application.Interfaces;
using Application.Steps;
using AutoMapper;
using Domain;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Templates;

/// <summary>
///     Edits the template with the given ID
/// </summary>
public class Edit
{
    [DisplayName("EditTemplateInput")]
    public class Command : IRequest<Result<TemplateResponse>?>
    {
        [JsonIgnore] public Guid TemplateId { get; set; }

        public string? Name { get; set; }
        public string? Description { get; set; }
        public List<TemplateStepDto>? Steps { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(30);
            RuleFor(x => x.Description).MaximumLength(500).When(x => x.Description != null);
            RuleForEach(x => x.Steps).SetValidator(new TemplateStepValidator());
        }
    }

    public class Handler : IRequestHandler<Command, Result<TemplateResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly IMediaAccessor _mediaAccessor;

        public Handler(DataContext context, IMapper mapper, IMediaAccessor mediaAccessor)
        {
            _mapper = mapper;
            _mediaAccessor = mediaAccessor;
            _context = context;
        }

        public async Task<Result<TemplateResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var template = await _context.Templates
                .Include(x => x.Steps)
                .ThenInclude(x => x.Media)
                .FirstOrDefaultAsync(x => x.Id == request.TemplateId, cancellationToken);

            if (template == null)
            {
                return null;
            }

            // Update the values that are not null
            template.Name = request.Name?.Trim() ?? template.Name;
            template.Description = request.Description?.Trim() ?? template.Description;
            template.UpdatedAt = DateTime.Now;

            // Update steps
            foreach (var requestStep in request.Steps!)
            {
                var step = template.Steps.FirstOrDefault(x => x.Id == requestStep.Id);

                // Step does not exist, so create it
                if (step == null)
                {
                    var newStep = new TemplateStep
                    {
                        Name = requestStep.Name?.Trim(),
                        Duration = requestStep.Duration,
                        Position = requestStep.Position,
                        Template = template,
                    };
                    
                    if (requestStep.Media != null)
                    {
                        var filename = StepUtils.GetFileName(newStep.Name!, requestStep.Media!);
                        var media = await _mediaAccessor.UploadMedia(template.Id, requestStep.Media!, filename);
                        newStep.Media = media;
                    }
                    
                    template.Steps.Add(newStep);
                }
                else
                {
                    step.Name = requestStep.Name?.Trim() ?? step.Name;
                    step.Duration = requestStep.Duration;
                    step.Position = requestStep.Position;
                    
                    // Upload media
                    if (requestStep.Media == null) continue;
                    if (step.Media != null)
                    {
                        _mediaAccessor.DeleteMedia(template.Id, step.Media.FileName!);
                    }

                    var filename = StepUtils.GetFileName(step.Name!, requestStep.Media!);
                    var media = await _mediaAccessor.UploadMedia(template.Id, requestStep.Media!, filename);
                    step.Media = media;
                }
            }

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            template.Steps = template.Steps.OrderBy(x => x.Position).ToList();

            return success
                ? Result<TemplateResponse>.Success(_mapper.Map<Template, TemplateResponse>(template))
                : Result<TemplateResponse>.Failure("Failed to update template");
        }
    }
}
