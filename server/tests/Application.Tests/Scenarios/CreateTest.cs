using System;
using System.Threading;
using Application.Core;
using Application.Interfaces;
using Application.Scenarios;
using AutoMapper;
using Domain;
using Microsoft.EntityFrameworkCore;
using Moq;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Scenarios;

public class CreateTest : TestBase
{
    private readonly IMapper _mapper;

    public CreateTest()
    {
        var mockMapper = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task Should_Successfully_Create_Scenario()
    {
        // arrange
        var user = new AppUser { Id = Guid.NewGuid().ToString() };

        var userAccessor = new Mock<IUserAccessor>();
        userAccessor.Setup(u => u.GetUserId()).Returns(user.Id);

        var context = GetDbContext();
        context.Users.Add(user);

        var pid = Guid.NewGuid();
        context.Projects.Add(new Project { Id = pid, Name = "Test Project 1" });
        context.Projects.Add(new Project { Id = Guid.NewGuid(), Name = "Test Project 2" });

        await context.SaveChangesAsync();

        const string name = "Test Scenario";
        var command = new CreateScenario.Command { ProjectId = pid, Name = name };

        // act
        var sut = new CreateScenario.Handler(context, userAccessor.Object, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        var project = await context.Projects.FirstOrDefaultAsync(x => x.Id == pid);

        Assert.NotNull(result?.Value);
        Assert.Equal(name, result?.Value?.Name);
        Assert.Equal(1, project?.Scenarios.Count);
    }

    [Fact]
    public async Task Should_Return_Null_If_Project_Not_Found()
    {
        // arrange
        var user = new AppUser { Id = Guid.NewGuid().ToString() };

        var userAccessor = new Mock<IUserAccessor>();
        userAccessor.Setup(u => u.GetUserId()).Returns(user.Id);

        var context = GetDbContext();
        context.Users.Add(user);

        var pid = Guid.NewGuid();
        await context.SaveChangesAsync();

        const string name = "Test Scenario";
        var command = new CreateScenario.Command { ProjectId = pid, Name = name };

        // act
        var sut = new CreateScenario.Handler(context, userAccessor.Object, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        Assert.Null(result?.Value);
    }

    [Fact]
    public async Task Should_Return_Null_If_User_Not_Found()
    {
        // arrange
        var userAccessor = new Mock<IUserAccessor>();
        userAccessor.Setup(u => u.GetUserId()).Returns(Guid.NewGuid().ToString());

        var context = GetDbContext();

        var pid = Guid.NewGuid();
        context.Projects.Add(new Project { Id = pid, Name = "Test Project 1" });
        context.Projects.Add(new Project { Id = Guid.NewGuid(), Name = "Test Project 2" });

        await context.SaveChangesAsync();

        const string name = "Test Scenario";
        var command = new CreateScenario.Command { ProjectId = pid, Name = name };

        // act
        var sut = new CreateScenario.Handler(context, userAccessor.Object, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        Assert.Null(result?.Value);
    }
}
