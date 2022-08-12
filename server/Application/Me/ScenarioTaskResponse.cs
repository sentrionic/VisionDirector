using System.ComponentModel;
using Application.Scenarios;
using Application.Tasks;

namespace Application.Me;

/// <summary>
///     The task + its scenario DTO.
/// </summary>
[DisplayName("ScenarioTaskResponse")]
public class ScenarioTaskResponse
{
    public TaskResponse? Task { get; set; }
    public ScenarioResponse? Scenario { get; set; }
}
