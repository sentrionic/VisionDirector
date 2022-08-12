using System.Text.Json.Serialization;
using Application.Common;
using Application.Core;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Projects;

/// <summary>
///     Returns a list of users that are members of the given project
/// </summary>
public class ListCollaborators
{
    public class Query : IRequest<Result<List<Collaborator>>>
    {
        [JsonIgnore] public Guid ProjectId { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<List<Collaborator>>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<List<Collaborator>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var collaborators = await _context.Collaborators
                .Where(x => x.ProjectId == request.ProjectId)
                .Select(u => u.AppUser)
                .ProjectTo<Collaborator>(_mapper.ConfigurationProvider)
                .ToListAsync(cancellationToken);

            return Result<List<Collaborator>>.Success(collaborators);
        }
    }
}
