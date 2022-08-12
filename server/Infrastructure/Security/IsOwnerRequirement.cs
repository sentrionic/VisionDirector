using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Infrastructure.Security;

/// <summary>
///     Checks if the user is the creator of the scenario
/// </summary>
public class IsOwnerRequirement : IAuthorizationRequirement
{
}

public class IsOwnerRequirementHandler : AuthorizationHandler<IsOwnerRequirement>
{
    private readonly DataContext _dbContext;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public IsOwnerRequirementHandler(DataContext dbContext,
        IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
        _dbContext = dbContext;
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, IsOwnerRequirement requirement)
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

        // Get the scenario
        var scenario = _dbContext.Scenarios
            .Include(x => x.Owner)
            .AsNoTracking()
            .SingleOrDefaultAsync(x => x.Id == Guid.Parse(scenarioId))
            .Result;

        if (scenario == null)
        {
            return Task.CompletedTask;
        }

        // Check if the current user is the owner
        if (scenario.Owner!.Id == userId)
        {
            context.Succeed(requirement);
        }

        return Task.CompletedTask;
    }
}
