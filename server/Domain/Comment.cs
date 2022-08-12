namespace Domain;

/// <summary>
///     The comment DB model
/// </summary>
public class Comment
{
    public Guid Id { get; set; }
    public string? Body { get; set; }
    public AppUser? Author { get; set; }
    public Guid TaskId { get; set; }
    public Task? Task { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    public DateTime UpdatedAt { get; set; } = DateTime.Now;
}
