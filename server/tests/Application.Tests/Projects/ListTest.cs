using System;
using System.Threading;
using Application.Core;
using Application.Interfaces;
using Application.Projects;
using AutoMapper;
using Domain;
using Moq;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Projects;

public class ListTest : TestBase
{
    private readonly IMapper _mapper;

    public ListTest()
    {
        var mockMapper = new MapperConfiguration(cfg => { cfg.AddProfile(new MappingProfiles()); });
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task List_Should_Return_List_Of_Projects()
    {
        // arrange
        var user = new AppUser { Id = Guid.NewGuid().ToString() };
        var userAccessor = new Mock<IUserAccessor>();
        userAccessor.Setup(u => u.GetUserId()).Returns(user.Id);

        var context = GetDbContext();

        var project1 = new Project { Id = Guid.NewGuid(), Name = "Test Project 1" };
        project1.Collaborators.Add(new Domain.Collaborators { AppUser = user });

        var project2 = new Project { Id = Guid.NewGuid(), Name = "Test Project 2" };
        project2.Collaborators.Add(new Domain.Collaborators { AppUser = user });

        context.Projects.Add(project1);
        context.Projects.Add(project2);
        await context.SaveChangesAsync();

        // act
        var sut = new ProjectList.Handler(context, _mapper, userAccessor.Object);
        var result = await sut.Handle(new ProjectList.Query(), CancellationToken.None);

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(2, result?.Value?.Count);
        Assert.Equal("Test Project 2", result?.Value?[0].Name);
    }

    [Fact]
    public async Task List_Should_Only_Return_List_Of_Projects_User_Is_Member_In()
    {
        // arrange
        var user = new AppUser { Id = Guid.NewGuid().ToString() };
        var userAccessor = new Mock<IUserAccessor>();
        userAccessor.Setup(u => u.GetUserId()).Returns(user.Id);

        var context = GetDbContext();

        var project1 = new Project { Id = Guid.NewGuid(), Name = "Test Project 1" };
        project1.Collaborators.Add(new Domain.Collaborators { AppUser = user });

        var project2 = new Project { Id = Guid.NewGuid(), Name = "Test Project 2" };
        var project3 = new Project { Id = Guid.NewGuid(), Name = "Test Project 3" };

        context.Projects.Add(project1);
        context.Projects.Add(project2);
        context.Projects.Add(project3);
        await context.SaveChangesAsync();

        // act
        var sut = new ProjectList.Handler(context, _mapper, userAccessor.Object);
        var result = await sut.Handle(new ProjectList.Query(), CancellationToken.None);

        // assert
        Assert.NotNull(result?.Value);
        Assert.Equal(1, result?.Value?.Count);
        Assert.Equal("Test Project 1", result?.Value?[0].Name);
    }
}
