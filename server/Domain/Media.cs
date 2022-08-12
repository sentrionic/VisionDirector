namespace Domain;

/// <summary>
/// The media DB model
/// </summary>
public class Media
{
    public Guid Id { get; set; }
    public string? FileUrl { get; set; }
    public string? MimeType { get; set; }
    public string? FileName { get; set; }
}
