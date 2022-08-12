using Application.Comments;
using Application.Common;
using Application.Me;
using Application.Projects;
using Application.Scenarios;
using Application.Steps;
using Application.Tasks;
using Application.Templates;
using AutoMapper;
using Domain;
using Task = Domain.Task;

namespace Application.Core;

/// <summary>
///     AutoMapper configuration profiles
/// </summary>
public class MappingProfiles : Profile
{
    public MappingProfiles()
    {
        string? currentId = null;

        CreateMap<Project, ProjectResponse>()
            .ForMember(d => d.ScenarioCount, o => o.MapFrom(p => p.Scenarios.Count));

        CreateMap<Scenario, ScenarioResponse>()
            .ForMember(d => d.StepCount, o => o.MapFrom(s => s.Steps.Count))
            .ForMember(d => d.Duration, o => o.MapFrom(s => s.Steps.Sum(x => x.Duration)))
            .ForMember(d => d.Owner, o => o.MapFrom(s => s.Owner!.UserName))
            .ForMember(d => d.IsOwner, o => o.MapFrom(s => s.Owner!.Id == currentId))
            .ForMember(d => d.Thumbnail,
                o => o.MapFrom(
                    s => s.Steps.OrderBy(x => x.Position).FirstOrDefault(x => x.Thumbnail != null)!.Thumbnail));

        CreateMap<Collaborators, Collaborator>()
            .ForMember(d => d.Username, o => o.MapFrom(s => s.AppUser!.UserName))
            .ForMember(d => d.Email, o => o.MapFrom(s => s.AppUser!.Email))
            .ForMember(d => d.Id, o => o.MapFrom(s => s.AppUser!.Id));

        CreateMap<AppUser, Collaborator>();

        CreateMap<Step, StepResponseLite>()
            // Don't care about isComplete here
            .ForMember(d => d.IsCompleted, o => o.MapFrom(x => false));

        CreateMap<Step, ScenarioStepResponse>();

        CreateMap<Task, TaskResponse>()
            .ForMember(d => d.IsCompleted, o => o.MapFrom(t => t.Completed));

        CreateMap<Media, MediaResponse>();

        CreateMap<Comment, CommentResponse>();

        CreateMap<Template, TemplateResponse>();

        CreateMap<TemplateStep, TemplateStepResponse>();
    }
}
