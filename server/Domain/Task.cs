namespace Domain;

/// <summary>
///     The task DB model
/// </summary>
public class Task
{
    public Guid Id { get; set; }
    public string? Title { get; set; }
    public string? Body { get; set; }
    public bool Completed { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    public DateTime UpdatedAt { get; set; } = DateTime.Now;
    public DateTime? Deadline { get; set; }
    public Scenario? Scenario { get; set; }
    public Guid? StepId { get; set; }
    public Step? Step { get; set; }
    public string? AssigneeId { get; set; }
    public AppUser? Assignee { get; set; }
    public bool IsMain { get; set; }
    public ICollection<Comment> Comments { get; set; } = new List<Comment>();
}
