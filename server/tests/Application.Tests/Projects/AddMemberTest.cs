using System;
using System.Collections.Generic;
using System.Threading;
using Application.Projects;
using Domain;
using Microsoft.EntityFrameworkCore;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Projects;

public class AddMemberTest : TestBase
{
    [Fact]
    public async Task Should_Successfully_Add_The_Members_To_The_Project()
    {
        // arrange
        var context = GetDbContext();
        var user1 = new AppUser { Id = Guid.NewGuid().ToString(), UserName = "Test" };
        var user2 = new AppUser { Id = Guid.NewGuid().ToString(), UserName = "Base" };
        context.Users.Add(user1);
        context.Users.Add(user2);

        var id = Guid.NewGuid();
        var project = new Project { Id = id, Name = "Test Project 1" };
        context.Projects.Add(project);

        await context.SaveChangesAsync();

        // act
        var sut = new AddMember.Handler(context);
        var result =
            await sut.Handle(new AddMember.Command { ProjectId = id, Ids = new List<string> { user1.Id, user2.Id } },
                CancellationToken.None);

        // assert
        Assert.NotNull(result?.Value);
        Assert.Null(result?.Error);

        var updatedProject = await context.Projects.FirstOrDefaultAsync(x => x.Id == id);
        Assert.Equal(2, updatedProject?.Collaborators.Count);
    }

    [Fact]
    public async Task Should_Only_Add_New_Members_To_The_Project()
    {
        // arrange
        var context = GetDbContext();
        var user1 = new AppUser { Id = Guid.NewGuid().ToString(), UserName = "Test" };
        var user2 = new AppUser { Id = Guid.NewGuid().ToString(), UserName = "Base" };
        context.Users.Add(user1);
        context.Users.Add(user2);

        var id = Guid.NewGuid();
        var project = new Project { Id = id, Name = "Test Project 1" };
        project.Collaborators.Add(new Domain.Collaborators { AppUser = user2, Project = project });
        context.Projects.Add(project);

        await context.SaveChangesAsync();

        // act
        var sut = new AddMember.Handler(context);
        var result =
            await sut.Handle(new AddMember.Command { ProjectId = id, Ids = new List<string> { user1.Id, user2.Id } },
                CancellationToken.None);

        // assert
        Assert.NotNull(result?.Value);
        Assert.Null(result?.Error);

        var updatedProject = await context.Projects.FirstOrDefaultAsync(x => x.Id == id);
        Assert.Equal(2, updatedProject?.Collaborators.Count);
    }
}
