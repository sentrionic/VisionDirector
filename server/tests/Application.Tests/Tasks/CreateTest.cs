using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using Application.Core;
using Application.Tasks;
using AutoMapper;
using Domain;
using Microsoft.EntityFrameworkCore;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Tasks;

public class CreateTest : TestBase
{
    private readonly IMapper _mapper;

    public CreateTest()
    {
        var mockMapper = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task Should_Successfully_Create_Task()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        context.Scenarios.Add(new Scenario { Id = sid, Name = "Test Scenario 1" });
        context.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 2" });

        await context.SaveChangesAsync();

        const string title = "Test Task 1";
        var command = new Create.Command { ScenarioId = sid, Title = title };

        // act
        var sut = new Create.Handler(context, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        var scenario = await context.Scenarios.Include(x => x.Tasks).FirstOrDefaultAsync(x => x.Id == sid);

        Assert.NotNull(result?.Value);
        Assert.Equal(title, result?.Value?.Title);
        Assert.Equal(1, scenario?.Tasks.Count);
    }

    [Fact]
    public async Task Should_Successfully_Add_Step_To_Created_Task()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        var stepId = Guid.NewGuid();

        context.Scenarios.Add(new Scenario
        {
            Id = sid,
            Name = "Test Scenario 1",
            Steps = new List<Step> { new() { Name = "Test Step 1", Id = stepId } }
        });
        context.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 2" });

        await context.SaveChangesAsync();

        const string title = "Test Task 1";
        var command = new Create.Command { ScenarioId = sid, StepId = stepId, Title = title };

        // act
        var sut = new Create.Handler(context, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        var scenario = await context.Scenarios.Include(x => x.Tasks).FirstOrDefaultAsync(x => x.Id == sid);

        Assert.NotNull(result?.Value);
        Assert.Equal(title, result?.Value?.Title);
        Assert.Equal(1, scenario?.Tasks.Count);
        Assert.Equal(stepId, scenario?.Tasks.ToList()[0].Step!.Id);
    }

    [Fact]
    public async Task Should_Successfully_Add_Assignee_To_Created_Task()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        var uid = Guid.NewGuid();

        context.Scenarios.Add(new Scenario { Id = sid, Name = "Test Scenario 1" });
        context.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 2" });

        context.Users.Add(new AppUser { Id = uid.ToString() });

        await context.SaveChangesAsync();

        const string title = "Test Task 1";
        var command = new Create.Command { ScenarioId = sid, AssigneeId = uid, Title = title };

        // act
        var sut = new Create.Handler(context, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        var scenario = await context.Scenarios.Include(x => x.Tasks).FirstOrDefaultAsync(x => x.Id == sid);

        Assert.NotNull(result?.Value);
        Assert.Equal(title, result?.Value?.Title);
        Assert.Equal(1, scenario?.Tasks.Count);
        Assert.Equal(uid.ToString(), scenario?.Tasks.ToList()[0].Assignee!.Id);
    }
}
