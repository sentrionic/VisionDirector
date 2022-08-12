using System.Text.Json.Serialization;
using Application.Core;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Steps;

/// <summary>
///     Returns a list of steps for the given scenario ID
/// </summary>
public class List
{
    public class Query : IRequest<Result<List<StepResponse>>>
    {
        [JsonIgnore] public Guid ScenarioId { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<List<StepResponse>>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;
        }

        public async Task<Result<List<StepResponse>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var steps = await _context.Steps
                .Where(x => x.Scenario!.Id == request.ScenarioId)
                .Include(x => x.Media)
                .Include(x => x.Audio)
                .OrderBy(x => x.Position)
                .ToListAsync(cancellationToken);

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
