using System.ComponentModel;
using System.Text.Json.Serialization;
using Application.Core;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Projects;

/// <summary>
///     Adds the given users to the project
/// </summary>
public class AddMember
{
    [DisplayName("AddMemberInput")]
    public class Command : IRequest<Result<Unit>?>
    {
        [JsonIgnore] public Guid ProjectId { get; set; }

        // User IDs
        public List<string> Ids { get; set; } = new();
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Ids).NotEmpty();
        }
    }

    public class Handler : IRequestHandler<Command, Result<Unit>?>
    {
        private readonly DataContext _context;

        public Handler(DataContext context)
        {
            _context = context;
        }

        public async Task<Result<Unit>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var project =
                await _context.Projects.FirstOrDefaultAsync(x => x.Id == request.ProjectId, cancellationToken);

            if (project == null)
            {
                return null;
            }

            // Get all users
            var newUsers = await _context.Users
                .Where(x => request.Ids.Contains(x.Id))
                .ToListAsync(cancellationToken);

            // Get all project members
            var collaborators = await _context.Users
                .Where(x => x.Projects!.Any(pc => pc.ProjectId == project.Id))
                .ToListAsync(cancellationToken);

            // Get the difference to only add the new users
            var users = newUsers.Except(collaborators).ToList();

            // Add the users
            foreach (var user in users)
            {
                var collaborator = new Domain.Collaborators { AppUser = user, Project = project };

                project.Collaborators.Add(collaborator);
            }

            var result = await _context.SaveChangesAsync(cancellationToken) > 0;

            return result ? Result<Unit>.Success(Unit.Value) : Result<Unit>.Failure("Failed to add members");
        }
    }
}
