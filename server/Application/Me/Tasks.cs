using Application.Core;
using Application.Interfaces;
using Application.Scenarios;
using Application.Tasks;
using AutoMapper;
using Domain;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;
using Task = Domain.Task;

namespace Application.Me;

/// <summary>
///     Returns a list of tasks the current user is assigned to
/// </summary>
public class Tasks
{
    public class Query : IRequest<Result<List<ScenarioTaskResponse>>?>
    {
    }

    public class Handler : IRequestHandler<Query, Result<List<ScenarioTaskResponse>>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly IUserAccessor _userAccessor;

        public Handler(DataContext context, IMapper mapper, IUserAccessor userAccessor)
        {
            _mapper = mapper;
            _userAccessor = userAccessor;
            _context = context;
        }

        public async Task<Result<List<ScenarioTaskResponse>>?> Handle(Query request,
            CancellationToken cancellationToken)
        {
            var user = await _context.Users.FirstOrDefaultAsync(x =>
                x.Id == _userAccessor.GetUserId(), cancellationToken);

            if (user == null)
            {
                return null;
            }

            var tasks = await _context.Tasks
                .Include(x => x.Scenario)
                .Where(x => x.AssigneeId == user.Id)
                .OrderByDescending(x => x.CreatedAt)
                .ToListAsync(cancellationToken);

            return Result<List<ScenarioTaskResponse>>.Success(tasks.Select(x => new ScenarioTaskResponse
            {
                Task = _mapper.Map<Task, TaskResponse>(x),
                Scenario = _mapper.Map<Scenario, ScenarioResponse>(x.Scenario!)
            }).ToList());
        }
    }
}