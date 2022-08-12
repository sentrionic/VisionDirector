using System.ComponentModel;
using System.Text.Json.Serialization;
using Application.Core;
using AutoMapper;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Tasks;

/// <summary>
///     Edits the task for the given ID
/// </summary>
public class Edit
{
    [DisplayName("EditTaskInput")]
    public class Command : IRequest<Result<TaskRecord>?>
    {
        [JsonIgnore] public Guid TaskId { get; set; }

        public string? Title { get; set; }
        public string? Body { get; set; }
        public bool? IsCompleted { get; set; }
        public Guid? AssigneeId { get; set; }
        public Guid? StepId { get; set; }
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

    public class Handler : IRequestHandler<Command, Result<TaskRecord>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<TaskRecord>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var task = await _context.Tasks
                .Where(x => x.Id == request.TaskId)
                .FirstOrDefaultAsync(cancellationToken);

            if (task == null)
            {
                return null;
            }

            var emitStep = request.IsCompleted != task.Completed;

            // Update the values that are not null
            task.Title = request.Title?.Trim() ?? task.Title;
            task.Body = request.Body?.Trim() ?? task.Body;
            task.Completed = request.IsCompleted ?? task.Completed;
            task.Deadline = request.Deadline ?? task.Deadline;
            task.UpdatedAt = DateTime.Now;

            // Assign the user if it's not null
            if (request.AssigneeId != null)
            {
                var assignee = await _context.Users.FirstOrDefaultAsync(x => x.Id == request.AssigneeId.ToString(),
                    cancellationToken);
                if (assignee == null)
                {
                    return Result<TaskRecord>.Failure("Assignee not found");
                }

                task.Assignee = assignee;
            }

            // Assign the step if it's not null
            if (request.StepId != null)
            {
                var step = await _context.Steps.FindAsync(new object?[] { request.StepId }, cancellationToken);
                if (step == null)
                {
                    return Result<TaskRecord>.Failure("Step not found");
                }

                task.Step = step;
            }

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            return success
                ? Result<TaskRecord>.Success(
                    new TaskRecord(_mapper.Map<TaskResponse>(task), emitStep))
                : Result<TaskRecord>.Failure("Failed to update task");
        }
    }
}
