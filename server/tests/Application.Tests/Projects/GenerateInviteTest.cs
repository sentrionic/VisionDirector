using System;
using System.Threading;
using Application.Interfaces;
using Application.Projects;
using Domain;
using Moq;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Projects;

public class GenerateInviteTest : TestBase
{
    [Fact]
    public async Task Should_Return_Token_For_Project()
    {
        // arrange
        const string token = "Token";
        var pid = Guid.NewGuid();

        var context = GetDbContext();

        context.Projects.Add(new Project { Id = pid, Name = "Test Project 1" });
        context.Projects.Add(new Project { Id = Guid.NewGuid(), Name = "Test Project 2" });
        await context.SaveChangesAsync();

        var cacheAccessor = new Mock<ICacheAccessor>();
        cacheAccessor.Setup(c => c.GenerateInvite(pid.ToString(), ExpirationDate.OneDay)).ReturnsAsync(token);

        // act
        var sut = new GenerateInvite.Handler(context, cacheAccessor.Object);
        var result = sut.Handle(new GenerateInvite.Command { ProjectId = pid }, CancellationToken.None).Result;

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(token, result?.Value?.Value);
    }

    [Fact]
    public void Should_Return_Null_If_Project_Not_Found()
    {
        // arrange
        var pid = Guid.NewGuid();
        var context = GetDbContext();
        var cacheAccessor = new Mock<ICacheAccessor>();

        // act
        var sut = new GenerateInvite.Handler(context, cacheAccessor.Object);
        var result = sut.Handle(new GenerateInvite.Command { ProjectId = pid }, CancellationToken.None).Result;

        // assert
        Assert.Null(result?.Value);
    }

    [Fact]
    public async Task Should_Return_Failure_If_Error()
    {
        // arrange
        var pid = Guid.NewGuid();
        var context = GetDbContext();

        context.Projects.Add(new Project { Id = pid, Name = "Test Project 1" });
        context.Projects.Add(new Project { Id = Guid.NewGuid(), Name = "Test Project 2" });
        await context.SaveChangesAsync();

        var cacheAccessor = new Mock<ICacheAccessor>();
        cacheAccessor.Setup(c => c.GenerateInvite(pid.ToString(), ExpirationDate.OneDay)).ReturnsAsync(value: null);

        // act
        var sut = new GenerateInvite.Handler(context, cacheAccessor.Object);
        var result = sut.Handle(new GenerateInvite.Command { ProjectId = pid }, CancellationToken.None).Result;

        // assert
        Assert.Null(result?.Value);
    }
}
