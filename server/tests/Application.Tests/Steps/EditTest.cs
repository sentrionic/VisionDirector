using System;
using System.Collections.Generic;
using System.Threading;
using Application.Core;
using Application.Interfaces;
using Application.Steps;
using AutoMapper;
using Domain;
using Moq;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Steps;

public class EditTest : TestBase
{
    private readonly IMapper _mapper;

    public EditTest()
    {
        var mockMapper = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task Should_Successfully_Edit_Step()
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

        const string name = "Test Step 1 Updated";
        var command = new Edit.Command { ScenarioId = sid, StepId = stepId, Name = name };

        // act
        var sut = new Edit.Handler(context, _mapper, new Mock<IMediaAccessor>().Object);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(name, result?.Value?.Name);
    }
}
