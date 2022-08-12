using System.Security.Claims;
using Domain;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Task = System.Threading.Tasks.Task;

namespace Infrastructure.Security;

/// <summary>
///     Checks if the user is the admin
/// </summary>
public class IsEngineerOrAdminRequirement : IAuthorizationRequirement
{
}

public class IsEngineerOrAdminRequirementHandler : AuthorizationHandler<IsEngineerOrAdminRequirement>
{
    private readonly UserManager<AppUser> _userManager;

    public IsEngineerOrAdminRequirementHandler(UserManager<AppUser> userManager)
    {
        _userManager = userManager;
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, IsEngineerOrAdminRequirement requirement)
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

        var isAdmin = _userManager.IsInRoleAsync(user, AppRoles.Admin.ToString()).Result;

        if (isAdmin)
        {
            context.Succeed(requirement);
        }

        var isModerator = _userManager.IsInRoleAsync(user, AppRoles.Moderator.ToString()).Result;

        if (isModerator)
        {
            context.Succeed(requirement);
        }

        return Task.CompletedTask;
    }
}
