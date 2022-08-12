using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using Application.Core;
using Application.Steps;
using AutoMapper;
using Domain;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace Application.Tests.Steps;

public class ChangePositionTest : TestBase
{
    private readonly IMapper _mapper;

    public ChangePositionTest()
    {
        var mockMapper = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async void Should_Adjust_The_Position_Of_All_Steps_Affected_By_The_Edited_One()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        var stepId = Guid.NewGuid();
        context.Scenarios.Add(new Scenario
        {
            Id = sid,
            Name = "Test Scenario 1",
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
        var command = new ChangePosition.Command { ScenarioId = sid, StepId = stepId, Position = 3 };

        var sut = new ChangePosition.Handler(context, _mapper);
        var result = await sut.Handle(command, CancellationToken.None);

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(stepId, result?.Value?.Id);

        var steps = await context.Steps.OrderBy(x => x.Position).Where(x => x.Scenario!.Id == sid)
            .ToListAsync(CancellationToken.None);

        Assert.Equal(4, steps.Count);
        Assert.Equal(0, steps[0].Position);
        Assert.Equal(1, steps[1].Position);
        Assert.Equal(2, steps[2].Position);
        Assert.Equal(3, steps[3].Position);
        Assert.Equal(stepId, steps[3].Id);
    }
}
