using System.Text.Json.Serialization;
using Application.Core;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Comments;

/// <summary>
///     Returns a list of comments for the given task ID
/// </summary>
public class List
{
    public class Query : IRequest<Result<List<CommentResponse>>>
    {
        [JsonIgnore] public Guid TaskId { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<List<CommentResponse>>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        public Handler(DataContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;
        }

        public async Task<Result<List<CommentResponse>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var comments = await _context.Comments
                .Where(x => x.TaskId == request.TaskId)
                .Include(x => x.Author)
                .OrderBy(x => x.CreatedAt)
                .ProjectTo<CommentResponse>(_mapper.ConfigurationProvider)
                .ToListAsync(cancellationToken);

            return Result<List<CommentResponse>>.Success(comments);
        }
    }
}
