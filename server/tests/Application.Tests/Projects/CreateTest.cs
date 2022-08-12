using System.Threading;
using Application.Core;
using Application.Projects;
using AutoMapper;
using Domain;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Projects;

public class CreateTest : TestBase
{
    private readonly IMapper _mapper;

    public CreateTest()
    {
        var mockMapper = new MapperConfiguration(cfg => { cfg.AddProfile(new MappingProfiles()); });
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public void Should_Create_Project_Success()
    {
        // arrange
        const string name = "Test Project";
        var context = GetDbContext();

        var activityCommand = new Create.Command { Name = name };

        // act
        var sut = new Create.Handler(context, _mapper);
        var result = sut.Handle(activityCommand, CancellationToken.None).Result;

        // assert
        Assert.NotNull(result);
        Assert.NotNull(result.Value);
        Assert.NotNull(result.Value?.Id);
        Assert.NotNull(result.Value?.CreatedAt);
        Assert.Equal(name, result.Value?.Name);
        Assert.Equal(0, result.Value?.ScenarioCount);
        Assert.Empty(result.Value?.Collaborators!);
    }

    [Fact]
    public async Task Should_Return_Error_Create_Project()
    {
        // arrange
        var context = GetDbContext(true);
        const string name = "Test Project";

        await context.Projects.AddAsync(new Project { Name = name });
        await context.SaveChangesAsync();

        var activityCommand = new Create.Command { Name = name };

        // act
        var sut = new Create.Handler(context, _mapper);
        var result = sut.Handle(activityCommand, CancellationToken.None).Result;

        // assert
        Assert.NotNull(result);
        Assert.NotNull(result.Error);
        Assert.Equal("Failed to create project", result.Error);
    }
}
