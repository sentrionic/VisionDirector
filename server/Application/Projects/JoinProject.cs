using System.ComponentModel;
using Application.Core;
using Application.Interfaces;
using AutoMapper;
using Domain;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Projects;

/// <summary>
///     Adds the current user to the project that is stored for the given token
/// </summary>
public class JoinProject
{
    [DisplayName("JoinProjectInput")]
    public class Command : IRequest<Result<ProjectResponse?>?>
    {
        public string Token { get; set; } = string.Empty;
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Token).NotEmpty();
        }
    }

    public class Handler : IRequestHandler<Command, Result<ProjectResponse?>?>
    {
        private readonly ICacheAccessor _cacheAccessor;
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly IUserAccessor _userAccessor;

        public Handler(DataContext context, ICacheAccessor cacheAccessor, IUserAccessor userAccessor, IMapper mapper)
        {
            _context = context;
            _cacheAccessor = cacheAccessor;
            _userAccessor = userAccessor;
            _mapper = mapper;
        }

        public async Task<Result<ProjectResponse?>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var user = await _context.Users.FirstOrDefaultAsync(x =>
                x.Id == _userAccessor.GetUserId(), cancellationToken);

            if (user == null)
            {
                return null;
            }

            var projectId = await _cacheAccessor.GetProjectFromInvite(request.Token.Trim());

            if (projectId == null)
            {
                return null;
            }

            var project = await _context.Projects
                .Include(x => x.Scenarios)
                .Include(x => x.Collaborators)
                .ThenInclude(x => x.AppUser)
                .FirstOrDefaultAsync(x => x.Id.ToString() == projectId, cancellationToken);

            if (project == null)
            {
                return null;
            }

            if (project.Collaborators.Any(x => x.AppUserId == user.Id))
            {
                return Result<ProjectResponse?>.Failure("The user is already a member");
            }

            var collaborator = new Collaborators { AppUser = user, Project = project };

            project.Collaborators.Add(collaborator);

            var result = await _context.SaveChangesAsync(cancellationToken) > 0;

            var response = _mapper.Map<Project, ProjectResponse>(project);

            return result
                ? Result<ProjectResponse?>.Success(response)
                : Result<ProjectResponse?>.Failure("There was an error adding the user");
        }
    }
}
