using Microsoft.AspNetCore.SignalR;

namespace API.SignalR;

/// <summary>
///     SignalR Hub to group together users that work on the given scenario.
///     Mapped to /ws
/// </summary>
[Authorize(Policy = Constants.IsProjectHubCollaborator)]
public class ScenarioHub : Hub
{
    public override async Task OnConnectedAsync()
    {
        var httpContext = Context.GetHttpContext();
        var scenarioId = httpContext?.Request.Query["scenarioId"];

        if (scenarioId.HasValue)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, scenarioId);
        }
    }
}
