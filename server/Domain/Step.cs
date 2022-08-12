namespace Domain;

/// <summary>
///     The step DB model
/// </summary>
public class Step
{
    public Guid Id { get; set; }
    public Guid ScenarioId { get; set; }
    public Scenario? Scenario { get; set; }
    public string? Name { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    public DateTime UpdatedAt { get; set; } = DateTime.Now;
    public Media? Media { get; set; }
    public Media? Audio { get; set; }
    public string? Thumbnail { get; set; }
    public string? Annotation { get; set; }
    public Transition? Transition { get; set; } = Domain.Transition.None;
    public int Duration { get; set; }
    public int Position { get; set; }
    public bool IsLocked { get; set; }
}
