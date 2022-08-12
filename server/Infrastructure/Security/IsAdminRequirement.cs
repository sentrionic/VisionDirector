using System.Security.Claims;
using Domain;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Task = System.Threading.Tasks.Task;

namespace Infrastructure.Security;

/// <summary>
///     Checks if the user is the admin
/// </summary>
public class IsAdminRequirement : IAuthorizationRequirement
{
}

public class IsAdminRequirementHandler : AuthorizationHandler<IsAdminRequirement>
{
    private readonly UserManager<AppUser> _userManager;

    public IsAdminRequirementHandler(UserManager<AppUser> userManager)
    {
        _userManager = userManager;
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, IsAdminRequirement requirement)
    {
        var userId = context.User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (userId == null)
        {
            return Task.CompletedTask;
        }

        var user = _userManager.FindByIdAsync(userId).Result;

        if (user == null)
        {
            return Task.CompletedTask;
        }

        var result = _userManager.IsInRoleAsync(user, AppRoles.Admin.ToString()).Result;

        if (result)
        {
            context.Succeed(requirement);
        }

        return Task.CompletedTask;
    }
}
