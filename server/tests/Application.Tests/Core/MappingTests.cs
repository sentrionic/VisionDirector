using System;
using System.Runtime.Serialization;
using Application.Comments;
using Application.Common;
using Application.Core;
using Application.Me;
using Application.Projects;
using Application.Scenarios;
using Application.Steps;
using Application.Tasks;
using Application.Templates;
using AutoMapper;
using Domain;
using Xunit;

namespace Application.Tests.Core;

public class MappingTests
{
    private readonly IConfigurationProvider _configuration;
    private readonly IMapper _mapper;

    public MappingTests()
    {
        _configuration = new MapperConfiguration(config =>
            config.AddProfile<MappingProfiles>());

        _mapper = _configuration.CreateMapper();
    }

    [Fact]
    public void ShouldHaveValidConfiguration()
    {
        _configuration.AssertConfigurationIsValid();
    }

    [Theory]
    [InlineData(typeof(Project), typeof(ProjectResponse))]
    [InlineData(typeof(Scenario), typeof(ScenarioResponse))]
    [InlineData(typeof(Collaborators), typeof(Collaborator))]
    [InlineData(typeof(AppUser), typeof(Collaborator))]
    [InlineData(typeof(Step), typeof(StepResponseLite))]
    [InlineData(typeof(Step), typeof(ScenarioStepResponse))]
    [InlineData(typeof(Task), typeof(TaskResponse))]
    [InlineData(typeof(Media), typeof(MediaResponse))]
    [InlineData(typeof(Comment), typeof(CommentResponse))]
    [InlineData(typeof(Template), typeof(TemplateResponse))]
    [InlineData(typeof(TemplateStep), typeof(TemplateStepResponse))]
    public void ShouldSupportMappingFromSourceToDestination(Type source, Type destination)
    {
        var instance = GetInstanceOf(source);

        _mapper.Map(instance, source, destination);
    }

    private object GetInstanceOf(Type type)
    {
        if (type.GetConstructor(Type.EmptyTypes) != null)
        {
            return Activator.CreateInstance(type)!;
        }

        // Type without parameterless constructor
        return FormatterServices.GetUninitializedObject(type);
    }
}
