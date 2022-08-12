using System.ComponentModel;
using System.Text.Json.Serialization;
using Application.Core;
using AutoMapper;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;
using Task = Domain.Task;

namespace Application.Tasks;

/// <summary>
///     Creates a task for the given scenario
/// </summary>
public class Create
{
    [DisplayName("CreateTaskInput")]
    public class Command : IRequest<Result<TaskResponse>?>
    {
        [JsonIgnore] public Guid ScenarioId { get; set; }

        public string? Title { get; set; }
        public string? Body { get; set; }
        public Guid? StepId { get; set; }
        public Guid? AssigneeId { get; set; }
        public DateTime? Deadline { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Title).NotEmpty().MaximumLength(150);
            RuleFor(x => x.Body).MaximumLength(2000).When(x => x.Body != null);
        }
    }

    public class Handler : IRequestHandler<Command, Result<TaskResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;
        }

        public async Task<Result<TaskResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var scenario = await _context.Scenarios
                .Include(x => x.Steps)
                .FirstOrDefaultAsync(x => x.Id == request.ScenarioId, cancellationToken);

            if (scenario == null)
            {
                return null;
            }

            var task = new Task
            {
                Title = request.Title?.Trim(),
                Body = request.Body?.Trim(),
                Deadline = request.Deadline
            };

            // Assign the user if it's not null
            if (request.AssigneeId != null)
            {
                var assignee = await _context.Users.FirstOrDefaultAsync(x => x.Id == request.AssigneeId.ToString(),
                    cancellationToken);
                if (assignee == null)
                {
                    return Result<TaskResponse>.Failure("Assignee not found");
                }

                task.Assignee = assignee;
            }

            // Assign the step if it's not null
            if (request.StepId != null)
            {
                var step = await _context.Steps.FindAsync(new object?[] { request.StepId }, cancellationToken);
                if (step == null)
                {
                    return Result<TaskResponse>.Failure("Step not found");
                }

                task.Step = step;
            }

            scenario.Tasks.Add(task);

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            return success
                ? Result<TaskResponse>.Success(_mapper.Map<TaskResponse>(task))
                : Result<TaskResponse>.Failure("Failed to add task");
        }
    }
}
