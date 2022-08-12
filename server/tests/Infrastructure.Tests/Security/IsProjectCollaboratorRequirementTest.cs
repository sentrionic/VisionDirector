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

public class IsProjectCollaboratorRequirementTest : TestBase
{
    private readonly DataContext _dataContext;
    private readonly Guid _pid = Guid.NewGuid();
    private readonly string _uid = Guid.NewGuid().ToString();

    public IsProjectCollaboratorRequirementTest()
    {
        var appUser = new AppUser { Id = _uid, Email = "test@test.com", UserName = "test" };

        var project = new Project { Id = _pid, Name = "Test Project" };

        _dataContext = GetDbContext();

        _dataContext.Collaborators.AddAsync(new Collaborators
        {
            AppUser = appUser,
            AppUserId = _uid,
            ProjectId = project.Id,
            Project = project
        });
        _dataContext.SaveChangesAsync();
    }

    [Fact]
    public async Task Handle_WhenCalledWithIdOfUserThatIsACollaborator_ShouldSucceed()
    {
        var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
        var context = new DefaultHttpContext();
        context.Request.RouteValues["id"] = _pid;
        mockHttpContextAccessor.Setup(_ => _.HttpContext).Returns(context);

        var user = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim> { new(ClaimTypes.NameIdentifier, _uid) }));

        var requirement = new IsProjectCollaboratorRequirement();

        var authContext =
            new AuthorizationHandlerContext(new List<IAuthorizationRequirement> { requirement }, user, null);

        var authHandler = new IsProjectCollaboratorRequirementHandler(_dataContext, mockHttpContextAccessor.Object);
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

        var requirement = new IsProjectCollaboratorRequirement();

        var authContext =
            new AuthorizationHandlerContext(new List<IAuthorizationRequirement> { requirement }, user, null);

        var authHandler = new IsProjectCollaboratorRequirementHandler(_dataContext, mockHttpContextAccessor.Object);
        await authHandler.HandleAsync(authContext);

        Assert.False(authContext.HasSucceeded);
    }

    [Fact]
    public async Task Handle_WhenCalledWithAUserThatIsNotAMember_ShouldFail()
    {
        var mockHttpContextAccessor = new Mock<IHttpContextAccessor>();
        var context = new DefaultHttpContext();
        context.Request.RouteValues["id"] = _pid;
        mockHttpContextAccessor.Setup(_ => _.HttpContext).Returns(context);

        var user = new ClaimsPrincipal(
            new ClaimsIdentity(new List<Claim> { new(ClaimTypes.NameIdentifier, Guid.NewGuid().ToString()) }));

        var requirement = new IsProjectCollaboratorRequirement();

        var authContext =
            new AuthorizationHandlerContext(new List<IAuthorizationRequirement> { requirement }, user, null);

        var authHandler = new IsProjectCollaboratorRequirementHandler(_dataContext, mockHttpContextAccessor.Object);
        await authHandler.HandleAsync(authContext);

        Assert.False(authContext.HasSucceeded);
    }
}
