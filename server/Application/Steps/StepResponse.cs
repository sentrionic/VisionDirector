using System.ComponentModel;
using Application.Common;
using AutoMapper;
using Domain;

namespace Application.Steps;

/// <summary>
///     The step DTO.
/// </summary>
[DisplayName("StepResponse")]
public class StepResponse
{
    public Guid Id { get; set; }
    public string? Name { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public MediaResponse? Media { get; set; }
    public MediaResponse? Audio { get; set; }
    public string? Thumbnail { get; set; }
    public string? Annotation { get; set; }
    public int Duration { get; set; }
    public int Position { get; set; }
    public bool IsLocked { get; set; }
    public bool IsCompleted { get; set; }
    public Collaborator? Assignee { get; set; }
    public Transition? Transition { get; set; }

    /// <summary>
    /// Returns the response dto to the given step.
    /// </summary>
    /// <param name="step">The step that gets mapped</param>
    /// <param name="mapper">AutoMapper</param>
    /// <param name="assignee">The optionally member assigned to this step</param>
    /// <param name="isCompleted">Whether the step is completed</param>
    /// <returns></returns>
    public static StepResponse ToResponse(Step step, IMapper mapper, AppUser? assignee = null,
        bool isCompleted = false)
    {
        return new StepResponse
        {
            Id = step.Id,
            Name = step.Name,
            CreatedAt = step.CreatedAt,
            UpdatedAt = step.UpdatedAt,
            Media = step.Media != null ? mapper.Map<MediaResponse>(step.Media) : null,
            Audio = step.Audio != null ? mapper.Map<MediaResponse>(step.Audio) : null,
            Thumbnail = step.Thumbnail,
            Annotation = step.Annotation,
            Duration = step.Duration,
            Position = step.Position,
            IsLocked = step.IsLocked,
            IsCompleted = isCompleted,
            Assignee = assignee != null ? mapper.Map<Collaborator>(assignee) : null,
            Transition = step.Transition,
        };
    }
}

/// <summary>
///     Return step dto with only the required attributes
/// </summary>
[DisplayName("StepResponseLite")]
public class StepResponseLite
{
    public Guid Id { get; set; }
    public string? Name { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public int Duration { get; set; }
    public int Position { get; set; }
    public bool IsLocked { get; set; }
    public bool IsCompleted { get; set; }
    public Transition? Transition { get; set; }
}
