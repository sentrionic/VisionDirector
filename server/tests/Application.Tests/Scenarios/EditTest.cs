using System;
using System.Threading;
using Application.Core;
using Application.Scenarios;
using AutoMapper;
using Domain;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Scenarios;

public class EditTest : TestBase
{
    private readonly IMapper _mapper;

    public EditTest()
    {
        var mockMapper = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task Should_Successfully_Edit_Scenario()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        context.Scenarios.Add(new Scenario { Id = sid, Name = "Test Scenario 1" });
        context.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 2" });

        await context.SaveChangesAsync();

        const string name = "Test Scenario 1 Updated";
        var command = new Edit.Command { Id = sid, Name = name };

        // act
        var sut = new Edit.Handler(context, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(name, result?.Value?.Name);
    }

    [Fact]
    public async Task Should_Return_Null_If_Scenario_Not_Found()
    {
        // arrange
        var context = GetDbContext();

        var sid = Guid.NewGuid();
        context.Scenarios.Add(new Scenario { Id = Guid.NewGuid(), Name = "Test Scenario 2" });

        await context.SaveChangesAsync();

        const string name = "Test Scenario 1 Updated";
        var command = new Edit.Command { Id = sid, Name = name };

        // act
        var sut = new Edit.Handler(context, _mapper);
        var result = sut.Handle(command, CancellationToken.None).Result;

        // assert
        Assert.Null(result?.Value);
    }
}
