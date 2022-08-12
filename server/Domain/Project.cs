namespace Domain;

/// <summary>
///     The project DB model
/// </summary>
public class Project
{
    public Guid Id { get; set; }
    public string? Name { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    public ICollection<Scenario> Scenarios { get; set; } = new List<Scenario>();
    public ICollection<Collaborators> Collaborators { get; set; } = new List<Collaborators>();
}
