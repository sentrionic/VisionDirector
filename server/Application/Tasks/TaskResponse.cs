using System.ComponentModel;
using Application.Common;
using Application.Steps;

namespace Application.Tasks;

/// <summary>
///     The task DTO.
/// </summary>
[DisplayName("TaskResponse")]
public class TaskResponse
{
    public Guid Id { get; set; }
    public string? Title { get; set; }
    public string? Body { get; set; }
    public bool IsCompleted { get; set; }
    public bool IsMain { get; set; }
    public StepResponseLite? Step { get; set; }
    public Collaborator? Assignee { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public DateTime? Deadline { get; set; }
}

public record TaskRecord(TaskResponse Response, bool EmitStep);