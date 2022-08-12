using System.ComponentModel;
using Domain;

namespace Application.Scenarios;

/// <summary>
///     The scenario DTO.
/// </summary>
[DisplayName("ScenarioResponse")]
public class ScenarioResponse
{
    public Guid Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public string? Url { get; set; }
    public string? Thumbnail { get; set; }
    public string? Owner { get; set; }
    public bool IsOwner { get; set; }
    public int StepCount { get; set; }
    public Status Status { get; set; }
    public int Duration { get; set; }
}
