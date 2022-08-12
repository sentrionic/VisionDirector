using System;
using System.Collections.Generic;
using System.Threading;
using Application.Core;
using Application.Interfaces;
using Application.Steps;
using AutoMapper;
using Domain;
using Microsoft.EntityFrameworkCore;
using Moq;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Steps;

public class CreateTest : TestBase
{
    private readonly IMapper _mapper;

    public CreateTest()
    {
        var mockMapper = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task Should_Successfully_Create_Steps()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        context.Scenarios.Add(new Scenario { Id = sid, Name = "Test Scenario 1" });
        context.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 2" });

        await context.SaveChangesAsync();

        const string name = "Test Scenario";
        var command = new Create.Command
        {
            ScenarioId = sid,
            Steps = new List<CreateStepDto>
            {
                new() { Name = name }, new() { Name = name + " 2" }, new() { Name = name + " 3" }
            }
        };

        // act
        var sut = new Create.Handler(context, _mapper, new Mock<IMediaAccessor>().Object);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        var scenario = await context.Scenarios.FirstOrDefaultAsync(x => x.Id == sid);

        Assert.NotNull(result?.Value);
        Assert.Equal(name, result?.Value?[0].Name);
        Assert.Equal(0, result?.Value?[0].Position);
        Assert.Equal(3, scenario?.Steps.Count);
    }

    [Fact]
    public async Task Should_Only_Return_New_Steps()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        context.Scenarios.Add(new Scenario
        {
            Id = sid,
            Name = "Test Scenario 1",
            Steps = new List<Step> { new() { Name = "Untitled" } }
        });
        context.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 2" });

        await context.SaveChangesAsync();

        const string name = "Test Scenario";
        var command = new Create.Command
        {
            ScenarioId = sid,
            Steps = new List<CreateStepDto>
            {
                new() { Name = name }, new() { Name = name + " 2" }, new() { Name = name + " 3" }
            }
        };

        // act
        var sut = new Create.Handler(context, _mapper, new Mock<IMediaAccessor>().Object);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        var scenario = await context.Scenarios.FirstOrDefaultAsync(x => x.Id == sid);

        Assert.NotNull(result?.Value);
        Assert.Equal(3, result?.Value?.Count);
        Assert.Equal(name, result?.Value?[0].Name);
        Assert.Equal(1, result?.Value?[0].Position);
        Assert.Equal(4, scenario?.Steps.Count);
    }

    [Fact]
    public async Task Should_Return_Null_If_Scenario_Not_Found()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();

        await context.SaveChangesAsync();

        const string name = "Test Scenario";
        var command = new Create.Command
        {
            ScenarioId = sid,
            Steps = new List<CreateStepDto>
            {
                new() { Name = name }, new() { Name = name + " 2" }, new() { Name = name + " 3" }
            }
        };

        // act
        var sut = new Create.Handler(context, _mapper, new Mock<IMediaAccessor>().Object);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        Assert.Null(result?.Value);
    }
}
