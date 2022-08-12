using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Infrastructure.Security;

/// <summary>
///     Checks if the user is a collaborator of the given scenario
/// </summary>
public class IsScenarioCollaboratorRequirement : IAuthorizationRequirement
{
}

public class IsScenarioCollaboratorRequirementHandler : AuthorizationHandler<IsScenarioCollaboratorRequirement>
{
    private readonly DataContext _dbContext;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public IsScenarioCollaboratorRequirementHandler(DataContext dbContext,
        IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
        _dbContext = dbContext;
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context,
        IsScenarioCollaboratorRequirement requirement)
    {
        var userId = context.User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (userId == null)
        {
            return Task.CompletedTask;
        }

        // Get the scenario id from the request route
        var scenarioId = _httpContextAccessor.HttpContext?.Request.RouteValues
            .SingleOrDefault(x => x.Key == "id").Value?.ToString();

        if (scenarioId == null)
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
