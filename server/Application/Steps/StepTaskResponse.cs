using System.ComponentModel;
using Application.Common;

namespace Application.Steps;

/// <summary>
///     The steptask DTO.
/// </summary>
[DisplayName("StepTaskResponse")]
public class StepTaskResponse
{
    public Guid Id { get; set; }
    public string? Name { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public int Position { get; set; }
    public bool IsCompleted { get; set; }
    public int TaskCount { get; set; }
    public int TaskCompletedCount { get; set; }
    public Collaborator? Assignee { get; set; }
}
