using System.ComponentModel;
using System.Text.Json.Serialization;
using Application.Core;
using AutoMapper;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Steps;

/// <summary>
///     Changes the position of all affected steps in the given scenario
/// </summary>
public class ChangePosition
{
    [DisplayName("ChangePositionInput")]
    public class Command : IRequest<Result<StepResponse>?>
    {
        [JsonIgnore] public Guid ScenarioId { get; set; }

        [JsonIgnore] public Guid StepId { get; set; }
        public int Position { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Position).GreaterThanOrEqualTo(0);
        }
    }

    public class Handler : IRequestHandler<Command, Result<StepResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;
        }

        public async Task<Result<StepResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var step = await _context.Steps
                .Include(x => x.Media)
                .Include(x => x.Audio)
                .FirstOrDefaultAsync(x => x.Id == request.StepId, cancellationToken);

            if (step == null)
            {
                return null;
            }

            // Get all steps but the current one sorted by position
            var steps = await _context.Steps.Where(x => x.Scenario!.Id == request.ScenarioId)
                .Where(x => x.Id != request.StepId).OrderBy(x => x.Position)
                .ToListAsync(cancellationToken);

            // Validate that the position is allowed
            if (steps.Count < request.Position)
            {
                return Result<StepResponse>.Failure("Position is greater than the amount of steps in the scenario");
            }

            // Update the values that are not null
            step.Position = request.Position;
            step.UpdatedAt = DateTime.Now;

            // Change the positions of all steps
            // Insert the current one at the right position
            steps.Insert(request.Position, step);

            // Use that list to determine the new position
            foreach (var s in steps)
            {
                s.Position = steps.FindIndex(x => s.Id == x.Id);
            }

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            var mainTask = await _context.Tasks
                .Include(x => x.Assignee)
                .FirstOrDefaultAsync(x => x.IsMain, cancellationToken);

            var dto = StepResponse.ToResponse(step, _mapper, mainTask?.Assignee, mainTask?.Completed ?? false);

            return success
                ? Result<StepResponse>.Success(dto)
                : Result<StepResponse>.Failure("Failed to update the position");
        }
    }
}
