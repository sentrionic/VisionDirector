using API.SignalR;
using Application.Common;
using Application.Core;
using Application.Scenarios;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

namespace API.Controllers;

[Produces("application/json")]
[Route("api/[controller]/{id:guid}")]
public class ScenariosController : BaseApiController
{
    private readonly IHubContext<ScenarioHub> _hub;
    public ScenariosController(IHubContext<ScenarioHub> hub)
    {
        _hub = hub;
    }

    /// <summary>
    ///     Fetches the project's scenarios
    /// </summary>
    /// <returns>A list of scenarios</returns>
    /// <response code="200">Returns a list of scenarios</response>
    [HttpGet("/api/projects/{id:guid}/scenarios")]
    [Authorize(Policy = Constants.IsProjectCollaborator)]
    [ProducesResponseType(typeof(List<ScenarioResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetProjectScenarios(Guid id)
    {
        return HandleResult(await Mediator.Send(new ScenarioList.Query { ProjectId = id }));
    }

    /// <summary>
    ///     Creates a new scenario.
    /// </summary>
    /// <remarks>
    ///     **Project Collaborators Only**
    /// 
    ///     Sample request:
    /// 
    ///     POST /api/projects/{id}/scenarios
    ///         {
    ///             "name": "Scenario Name"
    ///         }
    /// </remarks>
    /// <returns>The newly created scenario</returns>
    /// <response code="201">The newly created scenario</response>
    /// <response code="400">Validation fails</response>
    [HttpPost("/api/projects/{id:guid}/scenarios")]
    [Authorize(Policy = Constants.IsProjectCollaborator)]
    [ProducesResponseType(typeof(ScenarioResponse), StatusCodes.Status201Created)]
    public async Task<IActionResult> CreateScenario(CreateScenario.Command command, Guid id)
    {
        command.ProjectId = id;
        return HandleResult(await Mediator.Send(command));
    }

    /// <summary>
    ///     Edits the given scenario
    /// </summary>
    /// <remarks>
    /// **Scenario Owner Only**
    /// 
    /// Sample request:
    /// 
    ///     PUT /api/scenarios/{id}
    ///     {
    ///         "name": "Scenario Name"
    ///     }
    /// </remarks>
    /// <returns>The edited scenario</returns>
    /// <response code="200">The edited scenario</response>
    /// <response code="400">Validation fails</response>
    [HttpPut]
    [Authorize(Policy = Constants.IsScenarioOwner)]
    [ProducesResponseType(typeof(ScenarioResponse), StatusCodes.Status200OK)]
    public async Task<IActionResult> EditScenario(Guid id, Application.Scenarios.Edit.Command command)
    {
        command.Id = id;
        return await HandleHubResult(await Mediator.Send(command), id.ToString(), Constants.UpdateScenario);
    }

    /// <summary>
    ///     Uploads the video for the current scenario
    /// </summary>
    /// <remarks>
    /// **Scenario Owner Only**
    /// 
    /// Sample request:
    /// 
    ///     PUT /api/scenarios/{id}
    ///         FormData("file", "video.mp4")
    /// </remarks>
    /// <returns>The url for the video</returns>
    /// <response code="201">The url for the video</response>
    /// <response code="400">Validation fails</response>
    [HttpPut("video")]
    [Authorize(Policy = Constants.IsScenarioOwner)]
    [DisableRequestSizeLimit]
    [ProducesResponseType(typeof(GenericResponse), StatusCodes.Status201Created)]
    public async Task<IActionResult> UploadVideo(Guid id, [FromForm] UploadVideo.Command command)
    {
        command.Id = id;
        return HandleResult(await Mediator.Send(command));
    }

    /// <summary>
    ///     Similar to HandleResult but makes it so that the success values only get sent via SignalR.
    ///     Errors get returned over Http. Success returns Unit.
    /// </summary>
    /// <param name="result">The result object from the Command</param>
    /// <param name="id">The scenario id the result should get send to</param>
    /// <param name="method">The name of the method to invoke on the client</param>
    /// <typeparam name="T">Result DTO</typeparam>
    /// <returns>Result of an action method</returns>
    private async Task<ActionResult> HandleHubResult<T>(Result<T>? result, string id, string method)
    {
        if (result == null)
        {
            return NotFound();
        }

        var isSuccess = result is { IsSuccess: true };

        if (isSuccess)
        {
            await _hub.Clients.Group(id).SendAsync(method, result.Value);
        }

        return isSuccess ? Ok(Unit.Value) : BadRequest(result.Error);
    }
}
