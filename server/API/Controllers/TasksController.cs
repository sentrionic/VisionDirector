using API.SignalR;
using Application.Comments;
using Application.Core;
using Application.Steps;
using Application.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Create = Application.Tasks.Create;
using Edit = Application.Tasks.Edit;
using List = Application.Tasks.List;

namespace API.Controllers;

[Produces("application/json")]
[Route("api/scenarios/{id:guid}/[controller]")]
[Authorize(Policy = Constants.IsScenarioCollaborator)]
public class TasksController : BaseApiController
{
    private readonly IHubContext<ChatHub> _chatHub;
    private readonly IHubContext<ScenarioHub> _scenarioHub;
        
    public TasksController(IHubContext<ChatHub> chatHub, IHubContext<ScenarioHub> scenarioHub)
    {
        _chatHub = chatHub;
        _scenarioHub = scenarioHub;
    }

    /// <summary>
    ///     Fetches the given scenario's tasks
    /// </summary>
    /// <returns>The scenario's tasks</returns>
    /// <response code="200">The scenario's tasks</response>
    [HttpGet]
    [ProducesResponseType(typeof(List<TaskResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetTasks(Guid id, [FromQuery] TaskParams param)
    {
        return HandleResult(await Mediator.Send(new List.Query { ScenarioId = id, Params = param }));
    }

    /// <summary>
    ///     Creates a task for the given scenario
    /// </summary>
    /// <remarks>
    ///     Sample request:
    /// 
    ///     POST /api/scenarios/{id}/tasks
    ///         {
    ///             "title": "Task Title",
    ///             "body": "Task Body"
    ///         }
    /// </remarks>
    /// <returns>The newly created task</returns>
    /// <response code="201">The newly created task</response>
    /// <response code="400">Validation fails</response>
    [HttpPost]
    [ProducesResponseType(typeof(TaskResponse), StatusCodes.Status201Created)]
    public async Task<IActionResult> CreateTask(Guid id, Create.Command command)
    {
        command.ScenarioId = id;
        return await HandleHubResult(_scenarioHub, await Mediator.Send(command), id.ToString(), Constants.AddTask);
    }

    /// <summary>
    ///     Edits the task for the given id
    /// </summary>
    /// <remarks>
    ///     Sample request:
    /// 
    ///     PUT /api/scenarios/{id}/tasks/{taskId}
    ///         {
    ///             "title": "Task Title",
    ///             "body": "Task Body"
    ///         }
    /// </remarks>
    /// <returns>The edited task</returns>
    /// <response code="200">The edited task</response>
    /// <response code="400">Validation fails</response>
    [HttpPut("{taskId:guid}")]
    [ProducesResponseType(typeof(TaskResponse), StatusCodes.Status200OK)]
    public async Task<IActionResult> EditTask(Guid id, Guid taskId, Edit.Command command)
    {
        command.TaskId = taskId;
        var result = await Mediator.Send(command);
        
        if (result == null)
        {
            return NotFound();
        }
        
        if (!result.IsSuccess || result.Value == null)
            return result.IsSuccess switch
            {
                true when result.Value == null => NotFound(),
                _ => BadRequest(result.Error)
            };

        var taskResponse = Result<TaskResponse>.Success(result.Value.Response);

        // Check if it's the main task and if the IsCompleted status changed
        if (result.Value.Response.IsMain && result.Value.EmitStep)
        {
            // Update the step using websockets
            var stepResult = await Mediator.Send(new Detail.Query { StepId = result.Value.Response.Step!.Id });

            if (stepResult is { IsSuccess: true })
            {
                await _scenarioHub.Clients.Group(id.ToString()).SendAsync(Constants.EditStep, stepResult.Value!);
            }
        }
        
        return await HandleHubResult(_scenarioHub, taskResponse, id.ToString(), Constants.EditTask, true);
    }

    /// <summary>
    ///     Fetches the given task's comments
    /// </summary>
    /// <returns>The task's comments</returns>
    /// <response code="200">The task's comments</response>
    [HttpGet("{taskId:guid}/comments")]
    [ProducesResponseType(typeof(List<CommentResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetComment(Guid id, Guid taskId)
    {
        return HandleResult(await Mediator.Send(new Application.Comments.List.Query { TaskId = taskId }));
    }

    /// <summary>
    ///     Creates a comment for the given task.
    /// </summary>
    /// <remarks>
    ///     Sample request:
    /// 
    ///     POST /api/scenarios/{id}/tasks/{taskId}/comments
    ///         {
    ///             "body": "Comment Body"
    ///         }
    /// </remarks>
    /// <returns>The newly created task</returns>
    /// <response code="201">Unit</response>
    /// <response code="400">Validation fails</response>
    [HttpPost("{taskId:guid}/comments")]
    public async Task<IActionResult> SendComment(Guid id, Guid taskId, CreateComment.Command command)
    {
        command.TaskId = taskId;
        return await HandleHubResult(_chatHub, await Mediator.Send(command), taskId.ToString(), Constants.ReceiveComment);
    }

}
