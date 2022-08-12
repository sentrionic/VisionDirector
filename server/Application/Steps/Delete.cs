using System.Text.Json.Serialization;
using Application.Core;
using Application.Interfaces;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Steps;

/// <summary>
///     Delete the step with the given ID
/// </summary>
public class Delete
{
    public class Command : IRequest<Result<StepResponse>?>
    {
        [JsonIgnore] public Guid StepId { get; set; }
        [JsonIgnore] public Guid ScenarioId { get; set; }
    }

    public class Handler : IRequestHandler<Command, Result<StepResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly IMediaAccessor _mediaAccessor;

        public Handler(DataContext context, IMapper mapper, IMediaAccessor mediaAccessor)
        {
            _context = context;
            _mapper = mapper;
            _mediaAccessor = mediaAccessor;
        }

        public async Task<Result<StepResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var step = await _context.Steps
                .Include(x => x.Scenario)
                .Include(x => x.Media)
                .Include(x => x.Audio)
                .FirstOrDefaultAsync(x => x.Id == request.StepId, cancellationToken);

            if (step == null)
            {
                return null;
            }

            var projectId = step.Scenario!.ProjectId;
            var scenarioId = step.Scenario!.Id;

            // If media exists delete it
            if (step.Media != null)
            {
                _mediaAccessor.DeleteMedia(projectId, step.Media.FileName!, scenarioId);
            }

            if (step.Audio != null)
            {
                _mediaAccessor.DeleteMedia(projectId, step.Audio.FileName!, scenarioId);
            }

            if (step.Thumbnail != null)
            {
                var fileName = StepUtils.GetFileNameFromUrl(step.Thumbnail!);
                _mediaAccessor.DeleteMedia(projectId, fileName, scenarioId);
            }

            var task = await _context.Tasks.Where(x => x.StepId == step.Id && x.IsMain).FirstOrDefaultAsync(cancellationToken);
            
            if (task != null) _context.Remove(task);
            
            _context.Remove(step);

            // Move all steps after the current one back one position
            var steps = await _context.Steps.Where(x => x.Scenario!.Id == request.ScenarioId)
                .Where(x => x.Position > step.Position).ToListAsync(cancellationToken);

            foreach (var s in steps)
            {
                s.Position -= 1;
            }

            var result = await _context.SaveChangesAsync(cancellationToken) > 0;

            var mainTask = await _context.Tasks
                .Include(x => x.Assignee)
                .FirstOrDefaultAsync(x => x.IsMain, cancellationToken);

            var dto = StepResponse.ToResponse(step, _mapper, mainTask?.Assignee, mainTask?.Completed ?? false);

            return result
                ? Result<StepResponse>.Success(dto)
                : Result<StepResponse>.Failure("Failed to delete the step");
        }
    }
}
