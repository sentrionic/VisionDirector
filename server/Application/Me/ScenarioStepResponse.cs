using System.ComponentModel;
using Application.Common;
using Application.Scenarios;

namespace Application.Me;

/// <summary>
///     The scenario step DTO.
/// </summary>
[DisplayName("ScenarioStepResponse")]
public class ScenarioStepResponse
{
    public Guid Id { get; set; }
    public string? Name { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public MediaResponse? Media { get; set; }
    public MediaResponse? Audio { get; set; }
    public string? Thumbnail { get; set; }
    public string? Annotation { get; set; }
    public int Duration { get; set; }
    public ScenarioResponse? Scenario { get; set; }
}
