using System;
using System.Collections.Generic;
using System.Threading;
using Application.Core;
using Application.Tasks;
using AutoMapper;
using Domain;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Tasks;

public class EditTest : TestBase
{
    private readonly IMapper _mapper;

    public EditTest()
    {
        var mockMapper = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task Should_Successfully_Edit_Task()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        var taskId = Guid.NewGuid();
        context.Scenarios.Add(new Scenario
        {
            Id = sid,
            Name = "Test Scenario 1",
            Tasks = new List<Domain.Task>
            {
                new() { Id = taskId, Title = "Test Task 1" },
                new() { Id = Guid.NewGuid(), Title = "Test Task 2" }
            }
        });

        await context.SaveChangesAsync();

        const string title = "Test Task 1 Updated";
        var command = new Edit.Command { TaskId = taskId, Title = title };

        // act
        var sut = new Edit.Handler(context, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(title, result?.Value?.Response.Title);
    }

    [Fact]
    public async Task Should_Successfully_Add_Step_To_Edited_Task()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        var taskId = Guid.NewGuid();
        var stepId = Guid.NewGuid();

        context.Scenarios.Add(new Scenario
        {
            Id = sid,
            Name = "Test Scenario 1",
            Tasks = new List<Domain.Task>
            {
                new() { Id = taskId, Title = "Test Task 1" },
                new() { Id = Guid.NewGuid(), Title = "Test Task 2" }
            },
            Steps = new List<Step> { new() { Id = stepId, Name = "Test Step 1" } }
        });

        await context.SaveChangesAsync();

        const string title = "Test Task 1 Updated";
        var command = new Edit.Command { TaskId = taskId, Title = title, StepId = stepId };

        // act
        var sut = new Edit.Handler(context, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(title, result?.Value?.Response.Title);
        Assert.Equal(stepId, result?.Value?.Response.Step?.Id);
    }

    [Fact]
    public async Task Should_Successfully_Add_Assignee_To_Edited_Task()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        var taskId = Guid.NewGuid();
        var uid = Guid.NewGuid();

        context.Scenarios.Add(new Scenario
        {
            Id = sid,
            Name = "Test Scenario 1",
            Tasks = new List<Domain.Task>
            {
                new() { Id = taskId, Title = "Test Task 1" },
                new() { Id = Guid.NewGuid(), Title = "Test Task 2" }
            }
        });

        context.Users.Add(new AppUser { Id = uid.ToString() });

        await context.SaveChangesAsync();

        const string title = "Test Task 1 Updated";
        var command = new Edit.Command { TaskId = taskId, Title = title, AssigneeId = uid };

        // act
        var sut = new Edit.Handler(context, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(title, result?.Value?.Response.Title);
        Assert.Equal(uid.ToString(), result?.Value?.Response.Assignee?.Id);
    }
}
