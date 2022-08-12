using System.ComponentModel;
using Application.Core;
using AutoMapper;
using Domain;
using FluentValidation;
using MediatR;
using Persistence;

namespace Application.Templates;

/// <summary>
///     Creates a template
/// </summary>
public class Create
{
    [DisplayName("CreateTemplateInput")]
    public class Command : IRequest<Result<TemplateResponse>?>
    {
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? ProjectId { get; set; }
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

        public Handler(DataContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;
        }

        public async Task<Result<TemplateResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var template = new Template
            {
                Name = request.Name?.Trim(),
                Description = request.Description?.Trim()
            };

            if (!string.IsNullOrEmpty(request.ProjectId))
            {
                template.ProjectId = Guid.Parse(request.ProjectId);
            }

            // Create Steps
            if (request.Steps != null)
            {
                foreach (var requestStep in request.Steps!)
                {
                    var step = new TemplateStep
                    {
                        Name = requestStep.Name?.Trim(),
                        Duration = requestStep.Duration,
                        Position = requestStep.Position,
                    };
                    template.Steps.Add(step);
                }
            }

            _context.Templates.Add(template);

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            template.Steps = template.Steps.OrderBy(x => x.Position).ToList();

            return success
                ? Result<TemplateResponse>.Success(_mapper.Map<Template, TemplateResponse>(template))
                : Result<TemplateResponse>.Failure("Failed to create template");
        }
    }
}
