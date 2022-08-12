using Application.Me;
using Application.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[Produces("application/json")]
[Authorize]
public class MeController : BaseApiController
{
    /// <summary>
    ///     Fetches the given user's tasks
    /// </summary>
    /// <returns>The user's tasks</returns>
    /// <response code="200">The user's tasks</response>
    [HttpGet("tasks")]
    [ProducesResponseType(typeof(List<ScenarioTaskResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetUsersTasks()
    {
        return HandleResult(await Mediator.Send(new Tasks.Query()));
    }

    /// <summary>
    ///     Fetches the given user's steps
    /// </summary>
    /// <returns>The user's steps</returns>
    /// <response code="200">The user's steps</response>
    [HttpGet("steps")]
    [ProducesResponseType(typeof(List<ScenarioStepResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetUsersSteps()
    {
        return HandleResult(await Mediator.Send(new Steps.Query()));
    }
}
