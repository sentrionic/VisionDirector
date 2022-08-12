using API.SignalR;
using Application.Steps;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

namespace API.Controllers;

[Produces("application/json")]
[Route("api/scenarios/{id:guid}/[controller]")]
[Authorize(Policy = Constants.IsScenarioCollaborator)]
public class StepsController : BaseApiController
{
    private readonly IHubContext<ScenarioHub> _hub;
    public StepsController(IHubContext<ScenarioHub> hub)
    {
        _hub = hub;
    }

    /// <summary>
    ///     Fetches the given scenario's steps
    /// </summary>
    /// <returns>The scenario's steps</returns>
    /// <response code="200">The scenario's steps</response>
    [HttpGet]
    [ProducesResponseType(typeof(List<StepResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetSteps(Guid id)
    {
        return HandleResult(await Mediator.Send(new List.Query { ScenarioId = id }));
    }

    [HttpGet("/api/scenarios/{id:guid}/steptasks")]
    [ProducesResponseType(typeof(List<StepTaskResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetStepTasks(Guid id)
    {
        return HandleResult(await Mediator.Send(new StepTaskList.Query { ScenarioId = id }));
    }

    /// <summary>
    ///     Creates a list of steps for the scenario
    /// </summary>
    /// <remarks>
    ///     Sample request:
    /// 
    ///     POST /api/scenarios/{id}/steps
    /// 
    ///         FormData("steps[0].name", "Name")
    /// 
    ///         FormData("steps[0].fileUrl", "video.mp4")
    /// 
    ///         ...
    /// </remarks>
    /// <returns>A list containing all newly created steps</returns>
    /// <response code="201">Empty response</response>
    /// <response code="400">Validation fails</response>
    [HttpPost]
    [DisableRequestSizeLimit]
    public async Task<IActionResult> CreateSteps(Guid id, [FromForm] Create.Command command)
    {
        command.ScenarioId = id;
        return await HandleHubResult(_hub, await Mediator.Send(command), id.ToString(), Constants.AddSteps);
    }

    /// <summary>
    ///     Toggles the lock for the given step
    /// </summary>
    /// <remarks>
    ///     Sample request:
    /// 
    ///     POST /api/scenarios/{id}/steps/{stepId}/lock
    ///         {
    ///             "isLocked": true
    ///         }
    /// </remarks>
    /// <returns>The edited step</returns>
    /// <response code="200">The ID of the step</response>
    [HttpPost("{stepId:guid}/lock")]
    [ProducesResponseType(typeof(StepResponse), StatusCodes.Status200OK)]
    public async Task<IActionResult> ToggleLock(Guid id, Guid stepId, ToggleLock.Command command)
    {
        command.StepId = stepId;
        return await HandleHubResult(
            _hub,
            await Mediator.Send(command),
            id.ToString(),
            Constants.ToggleLock
        );
    }

    /// <summary>
    ///     Edits the given step
    /// </summary>
    /// <remarks>
    ///     Sample request:
    /// 
    ///     PUT /api/scenarios/{id}/steps/{stepId}
    /// 
    ///         FormData("steps.name", "Name")
    /// 
    ///         FormData("steps.fileUrl", "video.mp4")
    /// 
    ///         ...
    /// </remarks>
    /// <returns>The edited step</returns>
    /// <response code="200">The edited step</response>
    /// <response code="400">Validation fails</response>
    [HttpPut("{stepId:guid}")]
    [ProducesResponseType(typeof(StepResponse), StatusCodes.Status200OK)]
    [DisableRequestSizeLimit]
    public async Task<IActionResult> EditStep(Guid id, Guid stepId, [FromForm] Edit.Command command)
    {
        command.ScenarioId = id;
        command.StepId = stepId;
        return await HandleHubResult(
            _hub,
            await Mediator.Send(command),
            id.ToString(),
            Constants.EditStep,
            true
        );
    }

    /// <summary>
    ///     Edits the position of the given step and all affected steps of the scenario
    /// </summary>
    /// <remarks>
    ///     Sample request:
    /// 
    ///     PUT /api/scenarios/{id}/steps/{stepId}/position
    ///         {
    ///             "position": 0
    ///         }
    /// </remarks>
    /// <returns>The edited step</returns>
    /// <response code="200">Empty Response</response>
    /// <response code="400">Validation fails</response>
    [HttpPut("{stepId:guid}/position")]
    public async Task<IActionResult> ChangePosition(Guid id, Guid stepId, ChangePosition.Command command)
    {
        command.ScenarioId = id;
        command.StepId = stepId;
        return await HandleHubResult(_hub, await Mediator.Send(command), id.ToString(), Constants.ChangePosition);
    }

    /// <summary>
    ///     Deletes the step for the given ID
    /// </summary>
    /// <returns>The deleted step</returns>
    /// <response code="200">Empty Response</response>
    [HttpDelete("{stepId:guid}")]
    [ProducesResponseType(typeof(StepResponse), StatusCodes.Status200OK)]
    public async Task<IActionResult> DeleteStep(Guid id, Guid stepId)
    {
        return await HandleHubResult(
            _hub,
            await Mediator.Send(new Delete.Command { StepId = stepId, ScenarioId = id }),
            id.ToString(),
            Constants.RemoveStep
        );
    }

    [HttpPost("lock")]
    [Authorize(Policy = Constants.IsScenarioOwner)]
    public async Task<IActionResult> ToggleMultipleSteps(Guid id, ToggleMultipleLocks.Command command)
    {
        return await HandleHubResult(_hub, await Mediator.Send(command), id.ToString(), Constants.EditSteps);
    }
}
