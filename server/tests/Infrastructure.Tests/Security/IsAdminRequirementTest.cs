using System;
using System.Collections.Generic;
using System.Security.Claims;
using Domain;
using Infrastructure.Security;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Moq;
using Xunit;

namespace Infrastructure.Tests.Security;

public class IsAdminRequirementTest
{
    private static readonly string AdminId = Guid.NewGuid().ToString();
    private static readonly string NonAdminId = Guid.NewGuid().ToString();
    private readonly UserManager<AppUser> _userManager;

    private readonly List<AppUser> _users = new()
    {
        new AppUser { Id = AdminId, Email = "admin@test.com", UserName = "Admin" },
        new AppUser { Id = NonAdminId, Email = "test@test.com", UserName = "Test" }
    };

    public IsAdminRequirementTest()
    {
        _userManager = MockUserManager(_users).Object;
    }

    [Fact]
    public void Handle_WhenCalledWithAdminRole_ShouldSucceed()
    {
        var user = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim> { new(ClaimTypes.NameIdentifier, AdminId) }));

        var requirement = new IsAdminRequirement();

        var authContext =
            new AuthorizationHandlerContext(new List<IAuthorizationRequirement> { requirement }, user, null);

        var authHandler = new IsAdminRequirementHandler(_userManager);
        authHandler.HandleAsync(authContext);

        Assert.True(authContext.HasSucceeded);
    }

    [Fact]
    public void Handle_WhenCalledWithNonAdminRole_ShouldFail()
    {
        var user = new ClaimsPrincipal(
            new ClaimsIdentity(new List<Claim> { new(ClaimTypes.NameIdentifier, NonAdminId) }));
        var requirement = new IsAdminRequirement();

        var authContext =
            new AuthorizationHandlerContext(new List<IAuthorizationRequirement> { requirement }, user, null);

        var authHandler = new IsAdminRequirementHandler(_userManager);
        authHandler.HandleAsync(authContext);

        Assert.False(authContext.HasSucceeded);
    }

    [Fact]
    public void Handle_WhenCalledWithNonUser_ShouldFail()
    {
        var user = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
        {
            new(ClaimTypes.NameIdentifier, Guid.NewGuid().ToString())
        }));
        var requirement = new IsAdminRequirement();

        var authContext =
            new AuthorizationHandlerContext(new List<IAuthorizationRequirement> { requirement }, user, null);

        var authHandler = new IsAdminRequirementHandler(_userManager);
        authHandler.HandleAsync(authContext);

        Assert.False(authContext.HasSucceeded);
    }

    private static Mock<UserManager<TAppUser>> MockUserManager<TAppUser>(IReadOnlyList<TAppUser> users)
        where TAppUser : class
    {
        var store = new Mock<IUserStore<TAppUser>>();
        var manager = new Mock<UserManager<TAppUser>>(store.Object, null, null, null, null, null, null, null, null);

        manager.Setup(x => x.FindByIdAsync(AdminId)).ReturnsAsync(users[0]);
        manager.Setup(x => x.FindByIdAsync(NonAdminId)).ReturnsAsync(users[1]);

        manager.Setup(x => x.IsInRoleAsync(users[0], AppRoles.Admin.ToString())).ReturnsAsync(true);
        manager.Setup(x => x.IsInRoleAsync(users[1], AppRoles.Admin.ToString())).ReturnsAsync(false);

        return manager;
    }
}
