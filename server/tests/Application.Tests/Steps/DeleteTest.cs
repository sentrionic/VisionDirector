using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using Application.Core;
using Application.Interfaces;
using Application.Steps;
using AutoMapper;
using Domain;
using Microsoft.EntityFrameworkCore;
using Moq;
using Xunit;

namespace Application.Tests.Steps;

public class DeleteTest : TestBase
{
    private readonly IMapper _mapper;

    public DeleteTest()
    {
        var mockMapper = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async void Should_Delete_Step()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        var pid = Guid.NewGuid();
        var stepId = Guid.NewGuid();
        context.Scenarios.Add(new Scenario
        {
            Id = sid,
            Name = "Test Scenario 1",
            Project = new Project { Id = pid },
            Steps = new List<Step>
            {
                new() { Id = stepId, Name = "Test Step 1" }, new() { Id = Guid.NewGuid(), Name = "Test Step 2" }
            }
        });
        await context.SaveChangesAsync();

        // act
        var sut = new Delete.Handler(context, _mapper, new Mock<IMediaAccessor>().Object);
        var result = await sut.Handle(new Delete.Command { StepId = stepId, ScenarioId = sid }, CancellationToken.None);

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(stepId, result?.Value?.Id);

        var scenario = await context.Scenarios.FirstOrDefaultAsync(x => x.Id == sid);

        Assert.Equal(1, scenario?.Steps.Count);
    }

    [Fact]
    public async void Should_Adjust_The_Position_Of_All_Steps_After_The_Deleted_One()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        var pid = Guid.NewGuid();
        var stepId = Guid.NewGuid();
        context.Scenarios.Add(new Scenario
        {
            Id = sid,
            Name = "Test Scenario 1",
            Project = new Project { Id = pid },
            Steps = new List<Step>
            {
                new() { Id = Guid.NewGuid(), Name = "Test Step 0", Position = 0 },
                new() { Id = stepId, Name = "Test Step 1", Position = 1 },
                new() { Id = Guid.NewGuid(), Name = "Test Step 2", Position = 2 },
                new() { Id = Guid.NewGuid(), Name = "Test Step 3", Position = 3 }
            }
        });
        await context.SaveChangesAsync();

        // act
        var sut = new Delete.Handler(context, _mapper, new Mock<IMediaAccessor>().Object);
        var result = await sut.Handle(new Delete.Command { StepId = stepId, ScenarioId = sid }, CancellationToken.None);

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(stepId, result?.Value?.Id);

        var scenario = await context.Scenarios.Include(x => x.Steps).FirstOrDefaultAsync(x => x.Id == sid);

        var steps = scenario!.Steps.ToList();
        Assert.Equal(3, steps.Count);
        Assert.Equal(0, steps[0].Position);
        Assert.Equal(1, steps[1].Position);
        Assert.Equal(2, steps[2].Position);
    }
}
