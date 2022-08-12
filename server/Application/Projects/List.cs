using Application.Core;
using Application.Interfaces;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Projects;

/// <summary>
///     Returns the current user's projects
/// </summary>
public class ProjectList
{
    public class Query : IRequest<Result<List<ProjectResponse>>?>
    {
    }

    public class Handler : IRequestHandler<Query, Result<List<ProjectResponse>>?>
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

        public async Task<Result<List<ProjectResponse>>?> Handle(Query request, CancellationToken cancellationToken)
        {
            var projects = await _context.Projects
                .Where(x => x.Collaborators.Any(c => c.AppUserId == _userAccessor.GetUserId()))
                .Include(x => x.Scenarios)
                .Include(x => x.Collaborators)
                .OrderByDescending(x => x.CreatedAt)
                .ProjectTo<ProjectResponse>(_mapper.ConfigurationProvider)
                .ToListAsync(cancellationToken);

            return Result<List<ProjectResponse>>.Success(projects);
        }
    }
}
