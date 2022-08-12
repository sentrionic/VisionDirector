using System;
using System.Threading;
using Application.Core;
using Application.Interfaces;
using Application.Projects;
using AutoMapper;
using Domain;
using Microsoft.EntityFrameworkCore;
using Moq;
using Xunit;
using Task = System.Threading.Tasks.Task;

namespace Application.Tests.Projects;

public class JoinProjectTest : TestBase
{
    private readonly IMapper _mapper;

    public JoinProjectTest()
    {
        var mockMapper = new MapperConfiguration(cfg => { cfg.AddProfile(new MappingProfiles()); });
        _mapper = mockMapper.CreateMapper();
    }

    [Fact]
    public async Task Should_Join_Project()
    {
        // arrange
        var uid = Guid.NewGuid().ToString();
        var pid = Guid.NewGuid();
        const string invite = "invite";

        var userAccessor = new Mock<IUserAccessor>();
        userAccessor.Setup(u => u.GetUserId()).Returns(uid);

        var cacheAccessor = new Mock<ICacheAccessor>();
        cacheAccessor.Setup(c => c.GetProjectFromInvite(invite)).ReturnsAsync(pid.ToString());

        var context = GetDbContext();

        await context.Users.AddAsync(new AppUser { Id = uid, Email = "test@test.com", UserName = "test" });

        await context.Projects.AddAsync(new Project { Id = pid, Name = "Test Project" });

        await context.SaveChangesAsync();

        var joinProjectCommand = new JoinProject.Command { Token = invite };

        // act
        var sut = new JoinProject.Handler(context, cacheAccessor.Object, userAccessor.Object, _mapper);
        var result = await sut.Handle(joinProjectCommand, CancellationToken.None);

        // assert
        Assert.NotNull(result);
        Assert.NotNull(result!.Value);

        Assert.Equal(pid, result.Value!.Id);

        var project = await context.Projects.FirstOrDefaultAsync(x => x.Id == pid);
        Assert.Equal(1, project?.Collaborators.Count);
    }

    [Fact]
    public async Task Should_Return_Null_If_No_Id_Found()
    {
        // arrange
        var uid = Guid.NewGuid().ToString();
        const string invite = "invite";

        var userAccessor = new Mock<IUserAccessor>();
        userAccessor.Setup(u => u.GetUserId()).Returns(uid);

        var cacheAccessor = new Mock<ICacheAccessor>();
        cacheAccessor.Setup(c => c.GetProjectFromInvite(invite)).ReturnsAsync(value: null);

        var context = GetDbContext();

        await context.Users.AddAsync(new AppUser { Id = uid, Email = "test@test.com", UserName = "test" });

        await context.SaveChangesAsync();

        var joinProjectCommand = new JoinProject.Command { Token = invite };

        // act
        var sut = new JoinProject.Handler(context, cacheAccessor.Object, userAccessor.Object, _mapper);
        var result = await sut.Handle(joinProjectCommand, CancellationToken.None);

        // assert
        Assert.Null(result?.Value);
    }
}
