using Application.Core;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Tasks;

/// <summary>
///     Returns a list of tasks for the given scenario ID
/// </summary>
public class List
{
    public class Query : IRequest<Result<List<TaskResponse>>>
    {
        public Guid ScenarioId { get; set; }
        public TaskParams? Params { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<List<TaskResponse>>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;
        }

        public async Task<Result<List<TaskResponse>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var query = _context.Tasks
                .Where(x => x.Scenario!.Id == request.ScenarioId)
                .OrderByDescending(x => x.CreatedAt)
                .AsQueryable();

            if (request.Params?.StepId != null)
            {
                query = query.Where(x => x.StepId == request.Params.StepId);
            }

            if (request.Params?.AssigneeId != null)
            {
                query = query.Where(x => x.AssigneeId == request.Params.AssigneeId.ToString());
            }

            if (request.Params?.IsMain == true)
            {
                query = query.Where(x => x.IsMain);
            }

            var tasks = await query
                .ProjectTo<TaskResponse>(_mapper.ConfigurationProvider)
                .ToListAsync(cancellationToken);

            return Result<List<TaskResponse>>.Success(tasks);
        }
    }
}
