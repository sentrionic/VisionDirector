namespace Domain;

/// <summary>
///     The template DB model
/// </summary>
public class Template
{
    public Guid Id { get; set; }
    public Guid? ProjectId { get; set; }
    public Project? Project { get; set; }
    public string? Name { get; set; }
    public string? Description { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    public DateTime UpdatedAt { get; set; } = DateTime.Now;
    public ICollection<TemplateStep> Steps { get; set; } = new List<TemplateStep>();
}

/// <summary>
///     The template step DB model
/// </summary>
public class TemplateStep
{
    public Guid Id { get; set; }
    public Guid TemplateId { get; set; }
    public Template? Template { get; set; }
    public string? Name { get; set; }
    public int Duration { get; set; }
    public int Position { get; set; }
    public Media? Media { get; set; }
}
