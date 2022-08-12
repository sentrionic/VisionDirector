using System;
using System.Collections.Generic;
using System.Threading;
using Application.Core;
using Application.Steps;
using AutoMapper;
using Domain;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Steps;

public class ToggleLockTest : TestBase
{
    private readonly IMapper _mapper;

    public ToggleLockTest()
    {
        var mockMapper = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task Should_Successfully_Lock_Step()
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
                new() { Id = stepId, Name = "Test Step 1" }, new() { Id = Guid.NewGuid(), Name = "Test Step 2" }
            }
        });
        await context.SaveChangesAsync();

        const bool isLocked = true;
        var command = new ToggleLock.Command { StepId = stepId, IsLocked = isLocked };

        // act
        var sut = new ToggleLock.Handler(context, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(stepId, result?.Value?.Id);
    }
}
