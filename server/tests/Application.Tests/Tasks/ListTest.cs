using System;
using System.Threading;
using Application.Core;
using Application.Tasks;
using AutoMapper;
using Domain;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Tasks;

public class ListTest : TestBase
{
    private readonly IMapper _mapper;

    public ListTest()
    {
        var mockMapper = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task List_Should_Return_List_Of_Tasks()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        var scenario = new Scenario { Id = sid, Name = "Test Scenario 1" };
        scenario.Tasks.Add(new Domain.Task { Id = Guid.NewGuid(), Title = "Test Task 1" });
        scenario.Tasks.Add(new Domain.Task { Id = Guid.NewGuid(), Title = "Test Task 2" });
        scenario.Tasks.Add(new Domain.Task { Id = Guid.NewGuid(), Title = "Test Task 3" });

        context.Scenarios.Add(scenario);

        await context.SaveChangesAsync();

        // act
        var sut = new List.Handler(context, _mapper);
        var result = await sut.Handle(new List.Query { ScenarioId = sid }, CancellationToken.None);

        // assert
        Assert.NotNull(result.Value);
        Assert.Equal(3, result.Value?.Count);
        Assert.Equal("Test Task 3", result.Value?[0].Title);
    }

    [Fact]
    public async Task List_Should_Return_List_Of_Tasks_In_Scenario()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        var scenario = new Scenario { Id = sid, Name = "Test Scenario 1" };
        scenario.Tasks.Add(new Domain.Task { Id = Guid.NewGuid(), Title = "Test Task 1" });
        scenario.Tasks.Add(new Domain.Task { Id = Guid.NewGuid(), Title = "Test Task 2" });

        context.Tasks.Add(new Domain.Task { Id = Guid.NewGuid(), Title = "Test Task 3" });

        context.Scenarios.Add(scenario);

        await context.SaveChangesAsync();

        // act
        var sut = new List.Handler(context, _mapper);
        var result = await sut.Handle(new List.Query { ScenarioId = sid }, CancellationToken.None);

        // assert
        Assert.NotNull(result.Value);
        Assert.Equal(2, result.Value?.Count);
        Assert.Equal("Test Task 2", result.Value?[0].Title);
    }
}
