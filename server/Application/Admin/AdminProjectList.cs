using Application.Core;
using Application.Projects;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Admin;

/// <summary>
///     Returns a list of all projects
/// </summary>
public class AdminProjectList
{
    public class Query : IRequest<Result<List<ProjectResponse>>?>
    {
    }

    public class Handler : IRequestHandler<Query, Result<List<ProjectResponse>>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<List<ProjectResponse>>?> Handle(Query request, CancellationToken cancellationToken)
        {
            var projects = await _context.Projects
                .Include(x => x.Scenarios)
                .Include(x => x.Collaborators)
                .ProjectTo<ProjectResponse>(_mapper.ConfigurationProvider)
                .ToListAsync(cancellationToken);

            return Result<List<ProjectResponse>>.Success(projects);
        }
    }
}
