using System;
using System.Collections.Generic;
using System.Security.Claims;
using Domain;
using Infrastructure.Security;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Moq;
using Persistence;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Infrastructure.Tests.Security;

public class IsOwnerRequirementTest : TestBase
{
    private readonly DataContext _dataContext;
    private readonly Guid _sid = Guid.NewGuid();
    private readonly string _uid = Guid.NewGuid().ToString();

    public IsOwnerRequirementTest()
    {
        var appUser = new AppUser { Id = _uid, Email = "test@test.com", UserName = "test" };

        var scenario = new Scenario { Id = _sid, Owner = appUser, Name = "Test Scenario" };

        _dataContext = GetDbContext();

        _dataContext.Scenarios.AddAsync(scenario);
        _dataContext.SaveChangesAsync();
    }

    [Fact]
    public async Task Handle_WhenCalledWithIdOfUserThatIsTheOwner_ShouldSucceed()
    {
        var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
        var context = new DefaultHttpContext();
        context.Request.RouteValues["id"] = _sid;
        mockHttpContextAccessor.Setup(_ => _.HttpContext).Returns(context);

        var user = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim> { new(ClaimTypes.NameIdentifier, _uid) }));

        var requirement = new IsOwnerRequirement();

        var authContext =
            new AuthorizationHandlerContext(new List<IAuthorizationRequirement> { requirement }, user, null);

        var authHandler = new IsOwnerRequirementHandler(_dataContext, mockHttpContextAccessor.Object);
        await authHandler.HandleAsync(authContext);

        Assert.True(authContext.HasSucceeded);
    }

    [Fact]
    public async Task Handle_WhenCalledWithoutRouteParam_ShouldFail()
    {
        var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
        var context = new DefaultHttpContext();
        mockHttpContextAccessor.Setup(_ => _.HttpContext).Returns(context);

        var user = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim> { new(ClaimTypes.NameIdentifier, _uid) }));

        var requirement = new IsOwnerRequirement();

        var authContext =
            new AuthorizationHandlerContext(new List<IAuthorizationRequirement> { requirement }, user, null);

        var authHandler = new IsOwnerRequirementHandler(_dataContext, mockHttpContextAccessor.Object);
        await authHandler.HandleAsync(authContext);

        Assert.False(authContext.HasSucceeded);
    }

    [Fact]
    public async Task Handle_WhenCalledWithAUserThatIsNotAMember_ShouldFail()
    {
        var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
        var context = new DefaultHttpContext();
        mockHttpContextAccessor.Setup(_ => _.HttpContext).Returns(context);

        var user = new ClaimsPrincipal(
            new ClaimsIdentity(new List<Claim> { new(ClaimTypes.NameIdentifier, Guid.NewGuid().ToString()) }));

        var requirement = new IsOwnerRequirement();

        var authContext =
            new AuthorizationHandlerContext(new List<IAuthorizationRequirement> { requirement }, user, null);

        var authHandler = new IsOwnerRequirementHandler(_dataContext, mockHttpContextAccessor.Object);
        await authHandler.HandleAsync(authContext);

        Assert.False(authContext.HasSucceeded);
    }
}
