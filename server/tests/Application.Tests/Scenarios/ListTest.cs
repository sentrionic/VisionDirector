using System;
using System.Threading;
using Application.Core;
using Application.Interfaces;
using Application.Scenarios;
using AutoMapper;
using Domain;
using Moq;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Scenarios;

public class ListTest : TestBase
{
    private readonly IMapper _mapper;

    public ListTest()
    {
        var mockMapper = new MapperConfiguration(cfg => { cfg.AddProfile(new MappingProfiles()); });
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task List_Should_Return_List_Of_Scenarios()
    {
        // arrange
        var user = new AppUser { Id = Guid.NewGuid().ToString() };
        var userAccessor = new Mock<IUserAccessor>();
        userAccessor.Setup(u => u.GetUserId()).Returns(user.Id);

        var context = GetDbContext();

        var pid = Guid.NewGuid();
        var project = new Project { Id = pid, Name = "Test Project 1" };
        project.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 1" });
        project.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 2" });

        context.Projects.Add(project);

        await context.SaveChangesAsync();

        // act
        var sut = new ScenarioList.Handler(context, _mapper, userAccessor.Object);
        var result = await sut.Handle(new ScenarioList.Query { ProjectId = pid }, CancellationToken.None);

        // assert
        Assert.NotNull(result.Value);
        Assert.Equal(2, result.Value?.Count);
        Assert.Equal("Test Scenario 2", result.Value?[0].Name);
    }

    [Fact]
    public async Task List_Should_Return_List_Of_Scenarios_In_Project()
    {
        // arrange
        var user = new AppUser { Id = Guid.NewGuid().ToString() };
        var userAccessor = new Mock<IUserAccessor>();
        userAccessor.Setup(u => u.GetUserId()).Returns(user.Id);

        var context = GetDbContext();

        var pid = Guid.NewGuid();
        var project = new Project { Id = pid, Name = "Test Project 1" };
        project.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 1" });

        context.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 2" });

        context.Projects.Add(project);

        await context.SaveChangesAsync();

        // act
        var sut = new ScenarioList.Handler(context, _mapper, userAccessor.Object);
        var result = await sut.Handle(new ScenarioList.Query { ProjectId = pid }, CancellationToken.None);

        // assert
        Assert.NotNull(result.Value);
        Assert.Equal(1, result.Value?.Count);
        Assert.Equal("Test Scenario 1", result.Value?[0].Name);
    }
}
