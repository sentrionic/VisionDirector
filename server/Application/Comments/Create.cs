using System.ComponentModel;
using System.Text.Json.Serialization;
using Application.Core;
using Application.Interfaces;
using AutoMapper;
using Domain;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Comments;

/// <summary>
///     Creates a comment for the given task
/// </summary>
public class CreateComment
{
    [DisplayName("CreateCommentInput")]
    public class Command : IRequest<Result<CommentResponse>?>
    {
        public string? Body { get; set; }
        [JsonIgnore] public Guid TaskId { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Body).NotNull().NotEmpty().MaximumLength(2000);
        }
    }

    public class Handler : IRequestHandler<Command, Result<CommentResponse>?>
    {
        private readonly IUserAccessor _userAccessor;
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper, IUserAccessor userAccessor)
        {
            _mapper = mapper;
            _context = context;
            _userAccessor = userAccessor;
        }

        public async Task<Result<CommentResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var task = await _context.Tasks.FindAsync(new object?[] { request.TaskId }, cancellationToken);

            if (task == null) return null;

            var user = await _context.Users
                .SingleOrDefaultAsync(x => x.Id == _userAccessor.GetUserId(), cancellationToken);

            var comment = new Comment
            {
                Author = user,
                Task = task,
                Body = request.Body?.Trim()
            };

            task.Comments.Add(comment);

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            return success
                ? Result<CommentResponse>.Success(_mapper.Map<CommentResponse>(comment))
                : Result<CommentResponse>.Failure("Failed to add comment");
        }
    }
}
