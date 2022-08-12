using System.ComponentModel;
using System.Text.Json.Serialization;
using Application.Core;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Steps;

/// <summary>
///     Toggles the isLocked property of the given step
/// </summary>
public class ToggleLock
{
    [DisplayName("ToggleLockInput")]
    public class Command : IRequest<Result<StepResponse>?>
    {
        [JsonIgnore] public Guid StepId { get; set; }
        public bool IsLocked { get; set; }
    }

    public class Handler : IRequestHandler<Command, Result<StepResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<StepResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var step = await _context.Steps
                .Include(x => x.Media)
                .Include(x => x.Audio)
                .Where(x => x.Id == request.StepId)
                .FirstOrDefaultAsync(cancellationToken);

            if (step == null)
            {
                return null;
            }

            if (step.IsLocked == request.IsLocked)
            {
                return Result<StepResponse>.Success(_mapper.Map<StepResponse>(step));
            }

            step.IsLocked = request.IsLocked;

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            var mainTask = await _context.Tasks
                .Include(x => x.Assignee)
                .FirstOrDefaultAsync(x => x.IsMain, cancellationToken);

            var dto = StepResponse.ToResponse(step, _mapper, mainTask?.Assignee, mainTask?.Completed ?? false);

            return success
                ? Result<StepResponse>.Success(dto)
                : Result<StepResponse>.Failure("Failed to toggle IsLocked for the step");
        }
    }
}
