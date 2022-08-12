using System.ComponentModel;
using Application.Common;

namespace Application.Projects;

/// <summary>
///     The project DTO.
/// </summary>
[DisplayName("ProjectResponse")]
public class ProjectResponse
{
    public Guid Id { get; set; }
    public string? Name { get; set; }
    public DateTime CreatedAt { get; set; }
    public int ScenarioCount { get; set; }
    public ICollection<Collaborator> Collaborators { get; set; } = new List<Collaborator>();
}
