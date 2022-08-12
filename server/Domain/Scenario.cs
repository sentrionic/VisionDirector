namespace Domain;

/// <summary>
///     The scenario DB model
/// </summary>
public class Scenario
{
    public Guid Id { get; set; }
    public Guid ProjectId { get; set; }
    public Project? Project { get; set; }
    public AppUser? Owner { get; set; }
    public string? Name { get; set; }
    public string? Description { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    public DateTime UpdatedAt { get; set; } = DateTime.Now;
    public string? Url { get; set; }
    public Status Status { get; set; } = Status.InProgress;
    public ICollection<Step> Steps { get; set; } = new List<Step>();
    public ICollection<Task> Tasks { get; set; } = new List<Task>();
}
