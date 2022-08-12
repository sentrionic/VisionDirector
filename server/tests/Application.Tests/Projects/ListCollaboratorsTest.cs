using System;
using System.Threading;
using Application.Core;
using Application.Projects;
using AutoMapper;
using Domain;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Projects;

public class ListCollaboratorsTest : TestBase
{
    private readonly IMapper _mapper;

    public ListCollaboratorsTest()
    {
        var mockMapper = new MapperConfiguration(cfg => { cfg.AddProfile(new MappingProfiles()); });
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task List_Should_Return_List_Of_Collaborators()
    {
        // arrange
        var user1 = new AppUser { Id = Guid.NewGuid().ToString(), UserName = "Test" };
        var user2 = new AppUser { Id = Guid.NewGuid().ToString(), UserName = "Base" };
        var context = GetDbContext();

        var id = Guid.NewGuid();
        var project = new Project { Id = id, Name = "Test Project 1" };
        project.Collaborators.Add(new Domain.Collaborators { AppUser = user1 });
        project.Collaborators.Add(new Domain.Collaborators { AppUser = user2 });

        context.Projects.Add(project);
        await context.SaveChangesAsync();

        // act
        var sut = new ListCollaborators.Handler(context, _mapper);
        var result = await sut.Handle(new ListCollaborators.Query { ProjectId = id }, CancellationToken.None);

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(2, result?.Value?.Count);
        Assert.Equal("Test", result?.Value?[0].Username);
    }

    [Fact]
    public async Task List_Should_Only_Return_List_Of_Users_That_Are_Members()
    {
        // arrange
        var user1 = new AppUser { Id = Guid.NewGuid().ToString(), UserName = "Test" };
        var user2 = new AppUser { Id = Guid.NewGuid().ToString(), UserName = "Base" };
        var context = GetDbContext();

        var id = Guid.NewGuid();
        var project1 = new Project { Id = id, Name = "Test Project 1" };
        project1.Collaborators.Add(new Domain.Collaborators { AppUser = user1 });

        var project2 = new Project { Id = Guid.NewGuid(), Name = "Test Project 2" };
        project2.Collaborators.Add(new Domain.Collaborators { AppUser = user2 });

        context.Projects.Add(project1);
        context.Projects.Add(project2);
        await context.SaveChangesAsync();

        // act
        var sut = new ListCollaborators.Handler(context, _mapper);
        var result = await sut.Handle(new ListCollaborators.Query { ProjectId = id }, CancellationToken.None);

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(1, result?.Value?.Count);
        Assert.Equal("Test", result?.Value?[0].Username);
    }
}
