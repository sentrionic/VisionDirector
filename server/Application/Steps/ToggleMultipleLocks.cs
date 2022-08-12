using System.ComponentModel;
using Application.Core;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Steps;

public class ToggleStepsInput
{
    public Guid StepId { get; set; }
    public bool IsLocked { get; set; }
}

public class ToggleMultipleLocks
{
    [DisplayName("ToggleMultipleLocksInput")]
    public class Command : IRequest<Result<List<StepResponse>>>
    {
        public List<ToggleStepsInput> Inputs { get; set; } = new();
    }

    public class Handler : IRequestHandler<Command, Result<List<StepResponse>>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<List<StepResponse>>> Handle(Command request, CancellationToken cancellationToken)
        {
            var steps = await _context.Steps
                .Include(x => x.Media)
                .Include(x => x.Audio)
                .Where(x => request.Inputs.Select(i => i.StepId).Contains(x.Id))
                .ToListAsync(cancellationToken);
            
            foreach (var input in request.Inputs)
            {
                var step = steps.FirstOrDefault(x => x.Id == input.StepId);
                if (step == null || step.IsLocked == input.IsLocked) continue;
                step.IsLocked = input.IsLocked;
                step.UpdatedAt = DateTime.Now;
            }

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            if (!success)
            {
                return Result<List<StepResponse>>.Failure("Failed to update the steps");
            }
            
            var results = steps.Select(step =>
            {
                var mainTask = _context.Tasks
                    .Include(x => x.Assignee)
                    .FirstOrDefaultAsync(x => x.IsMain && x.StepId == step.Id, cancellationToken).Result;
                var dto = StepResponse.ToResponse(step, _mapper, mainTask?.Assignee, mainTask?.Completed ?? false);
                return dto;
            }).ToList();

            return Result<List<StepResponse>>.Success(results);
        }
    }
}