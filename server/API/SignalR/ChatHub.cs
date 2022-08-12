using Application.Comments;
using MediatR;
using Microsoft.AspNetCore.SignalR;

namespace API.SignalR;

/// <summary>
///     SignalR Hub to group together users that work on the given task.
///     Mapped to /chat
/// </summary>
[Authorize(Policy = Constants.IsProjectHubCollaborator)]
public class ChatHub : Hub
{
    public override async Task OnConnectedAsync()
    {
        var httpContext = Context.GetHttpContext();
        var taskId = httpContext?.Request.Query["taskId"];

        if (taskId.HasValue)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, taskId);
        }
    }
}
