using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Infrastructure.Security;

public class IsCollaboratorHubRequirement : IAuthorizationRequirement
{
}

public class IsCollaboratorHubRequirementHandler : AuthorizationHandler<IsCollaboratorHubRequirement>
{
    private readonly DataContext _dbContext;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public IsCollaboratorHubRequirementHandler(DataContext dbContext,
        IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
        _dbContext = dbContext;
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, IsCollaboratorHubRequirement requirement)
    {
        var userId = context.User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (userId == null)
        {
            return Task.CompletedTask;
        }

        // Get the scenario id from the request route
        var scenarioId = _httpContextAccessor.HttpContext?.Request.Query["scenarioId"];

        if (!scenarioId.HasValue)
        {
            return Task.CompletedTask;
        }

        // Get the project that contains the scenario
        var project = _dbContext.Projects.Where(x => x.Scenarios.Any(s => s.Id == Guid.Parse(scenarioId)))
            .FirstOrDefaultAsync().Result;

        if (project == null)
        {
            return Task.CompletedTask;
        }

        // Check if the user is a member of the project
        var member = _dbContext.Collaborators
            .AsNoTracking()
            .SingleOrDefaultAsync(x => x.AppUserId == userId && x.ProjectId == project.Id)
            .Result;

        if (member != null)
        {
            context.Succeed(requirement);
        }

        return Task.CompletedTask;
    }
}
