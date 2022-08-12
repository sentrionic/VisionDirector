using Application.Core;
using Application.Interfaces;
using Application.Scenarios;
using Application.Steps;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Domain;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Me;

/// <summary>
///     Returns a list of steps the current user is assigned to
/// </summary>
public class Steps
{
    public class Query : IRequest<Result<List<ScenarioStepResponse>>?>
    {
    }

    public class Handler : IRequestHandler<Query, Result<List<ScenarioStepResponse>>?>
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

        public async Task<Result<List<ScenarioStepResponse>>?> Handle(Query request, CancellationToken cancellationToken)
        {
            var user = await _context.Users.FirstOrDefaultAsync(x =>
                x.Id == _userAccessor.GetUserId(), cancellationToken);

            if (user == null)
            {
                return null;
            }

            var steps = await _context.Steps
                .FromSqlInterpolated(
                    $"select S.* from \"Steps\" S join \"Tasks\" T on S.\"Id\" = T.\"StepId\" where T.\"AssigneeId\" = {user.Id} ORDER BY \"CreatedAt\" DESC")
                .ProjectTo<ScenarioStepResponse>(_mapper.ConfigurationProvider)
                .ToListAsync(cancellationToken);

            // Fetch the related main task and add it to the response
            var results = steps.Select(step =>
            {
                var scenario = _context.Scenarios
                    .FirstOrDefaultAsync(x => x.Steps.Any(s => step.Id == s.Id), cancellationToken).Result;

                if (scenario != null)
                {
                    step.Scenario = _mapper.Map<Scenario, ScenarioResponse>(scenario);
                }

                return step;
            }).ToList();

            return Result<List<ScenarioStepResponse>>.Success(results);
        }
    }
}
