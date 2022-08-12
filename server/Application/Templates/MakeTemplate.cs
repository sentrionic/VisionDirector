using System.ComponentModel;
using System.Text.Json.Serialization;
using Application.Core;
using Domain;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Templates;

/// <summary>
///     Creates a template out of the given scenario
/// </summary>
public class MakeTemplate
{
    [DisplayName("MakeTemplateInput")]
    public class Command : IRequest<Result<Unit>?>
    {
        public string? Name { get; set; }
        public string? Description { get; set; }

        [JsonIgnore] public Guid ScenarioId { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Name).NotNull().NotEmpty();
            RuleFor(x => x.Description).NotNull().NotEmpty();
        }
    }

    public class Handler : IRequestHandler<Command, Result<Unit>?>
    {
        private readonly DataContext _context;

        public Handler(DataContext context)
        {
            _context = context;
        }

        public async Task<Result<Unit>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var scenario =
                await _context.Scenarios
                    .Include(x => x.Steps)
                    .FirstOrDefaultAsync(x => x.Id == request.ScenarioId, cancellationToken);

            if (scenario == null) return null;

            if (scenario.Steps.Count == 0)
            {
                return Result<Unit>.Failure("Failed to create template. The scenario needs at least one step.");
            }

            var template = new Template
            {
                Name = request.Name,
                Description = request.Description,
                ProjectId = scenario.ProjectId
            };

            // Add the scenarios steps to the template
            foreach (var step in scenario.Steps)
            {
                template.Steps.Add(new TemplateStep
                {
                    Name = step.Name,
                    Position = step.Position,
                    Duration = step.Duration
                });
            }

            _context.Templates.Add(template);

            var result = await _context.SaveChangesAsync(cancellationToken) > 0;

            return result
                ? Result<Unit>.Success(Unit.Value)
                : Result<Unit>.Failure("Failed to create template");
        }
    }
}
