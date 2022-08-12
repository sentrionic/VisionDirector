using System.Text.Json.Serialization;
using Application.Core;
using Application.Interfaces;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Scenarios;

/// <summary>
///     Returns a list of scenarios for the given project ID
/// </summary>
public class ScenarioList
{
    public class Query : IRequest<Result<List<ScenarioResponse>>>
    {
        [JsonIgnore] public Guid ProjectId { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<List<ScenarioResponse>>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly IUserAccessor _userAccessor;

        public Handler(DataContext context, IMapper mapper, IUserAccessor userAccessor)
        {
            _context = context;
            _mapper = mapper;
            _userAccessor = userAccessor;
        }

        public async Task<Result<List<ScenarioResponse>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var scenarios = await _context.Scenarios
                .Where(x => x.Project!.Id == request.ProjectId)
                .Include(x => x.Steps)
                .Include(x => x.Owner)
                .OrderByDescending(x => x.UpdatedAt)
                .ProjectTo<ScenarioResponse>(_mapper.ConfigurationProvider,
                    new { currentId = _userAccessor.GetUserId() })
                .ToListAsync(cancellationToken);

            return Result<List<ScenarioResponse>>.Success(scenarios);
        }
    }
}
