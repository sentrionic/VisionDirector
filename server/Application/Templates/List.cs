using System.Text.Json.Serialization;
using Application.Core;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Templates;

/// <summary>
///     Returns a list of templates for the given project ID
/// </summary>
public class List
{
    public class Query : IRequest<Result<List<TemplateResponse>>>
    {
        [JsonIgnore] public Guid ProjectId { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<List<TemplateResponse>>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<List<TemplateResponse>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var templates = await _context.Templates
                .Where(x => x.ProjectId != null && x.ProjectId == request.ProjectId || x.Project == null)
                .Include(x => x.Steps)
                .ThenInclude(x => x.Media)
                .ProjectTo<TemplateResponse>(_mapper.ConfigurationProvider)
                .ToListAsync(cancellationToken);

            return Result<List<TemplateResponse>>.Success(templates.Select(t =>
            {
                // Order the templates steps by their position
                t.Steps = t.Steps.OrderBy(x => x.Position).ToList();
                return t;
            }).ToList());
        }
    }
}
