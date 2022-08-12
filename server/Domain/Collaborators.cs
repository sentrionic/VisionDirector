namespace Domain;

/// <summary>
///     Many-to-Many relationship of a project member
/// </summary>
public class Collaborators
{
    public string? AppUserId { get; set; }
    public AppUser? AppUser { get; set; }
    public Guid ProjectId { get; set; }
    public Project? Project { get; set; }
}
