using System.Text.Json.Serialization;
using Application.Common;
using Application.Core;
using AutoMapper;
using Domain;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Steps;

/// <summary>
///     Returns a list of steps and their tasks for the given scenario id.
/// </summary>
public class StepTaskList
{
    public class Query : IRequest<Result<List<StepTaskResponse>>>
    {
        [JsonIgnore] public Guid ScenarioId { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<List<StepTaskResponse>>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<List<StepTaskResponse>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var steps = await _context.Steps
                .Where(x => x.Scenario!.Id == request.ScenarioId)
                .OrderBy(x => x.Position)
                .ToListAsync(cancellationToken);

            var response = new List<StepTaskResponse>();

            foreach (var step in steps)
            {
                // Fetch the steps tasks
                var tasks = await _context.Tasks
                    .Where(x => x.StepId == step.Id)
                    .Include(x => x.Assignee)
                    .ToListAsync(cancellationToken);

                // Get the main task related to the step
                var mainTask = tasks.FirstOrDefault(x => x.IsMain);

                // Transform to the response
                response.Add(new StepTaskResponse
                {
                    Id = step.Id,
                    Name = step.Name,
                    Assignee = mainTask?.Assignee != null ? _mapper.Map<AppUser, Collaborator>(mainTask.Assignee) : null,
                    CreatedAt = step.CreatedAt,
                    UpdatedAt = step.UpdatedAt,
                    IsCompleted = mainTask?.Completed ?? false,
                    Position = step.Position,
                    TaskCount = tasks.Count,
                    TaskCompletedCount = tasks.Count(x => x.Completed)
                });
            }

            return Result<List<StepTaskResponse>>.Success(response);
        }
    }
}
