using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Infrastructure.Security;

/// <summary>
///     Checks if the user is a collaborator of the given project
/// </summary>
public class IsProjectCollaboratorRequirement : IAuthorizationRequirement
{
}

public class IsProjectCollaboratorRequirementHandler : AuthorizationHandler<IsProjectCollaboratorRequirement>
{
    private readonly DataContext _dbContext;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public IsProjectCollaboratorRequirementHandler(DataContext dbContext,
        IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
        _dbContext = dbContext;
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context,
        IsProjectCollaboratorRequirement requirement)
    {
        var userId = context.User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (userId == null)
        {
            return Task.CompletedTask;
        }

        // Get the project id from the request route
        var projectId = _httpContextAccessor.HttpContext?.Request.RouteValues
            .SingleOrDefault(x => x.Key == "id").Value?.ToString();

        if (projectId == null)
        {
            return Task.CompletedTask;
        }

        // Check if the user is a member of the project
        var member = _dbContext.Collaborators
            .AsNoTracking()
            .SingleOrDefaultAsync(x => x.AppUserId == userId && x.ProjectId == Guid.Parse(projectId))
            .Result;

        if (member != null)
        {
            context.Succeed(requirement);
        }

        return Task.CompletedTask;
    }
}
