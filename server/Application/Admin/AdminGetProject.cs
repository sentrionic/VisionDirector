using Application.Core;
using Application.Projects;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Admin;

/// <summary>
///     Returns the project for the given ID
/// </summary>
public class AdminGetProject
{
    public class Query : IRequest<Result<ProjectResponse>?>
    {
        public Guid Id { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<ProjectResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;
        }

        public async Task<Result<ProjectResponse>?> Handle(Query request, CancellationToken cancellationToken)
        {
            var project = await _context.Projects
                .Include(x => x.Collaborators)
                .ProjectTo<ProjectResponse>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync(x => x.Id == request.Id, cancellationToken);

            return project == null ? null : Result<ProjectResponse>.Success(project);
        }
    }
}
