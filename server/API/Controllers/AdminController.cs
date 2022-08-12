using Application.Admin;
using Application.Projects;
using Application.Scenarios;
using Application.Steps;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[Produces("application/json")]
[Authorize(Policy = Constants.IsAdmin)]
[Route("api/[controller]/projects")]
public class AdminController : BaseApiController
{
    /// <summary>
    ///     Fetches all projects
    /// </summary>
    /// <remarks>
    ///     **Admin only**
    /// </remarks>
    /// <returns>A list of projects</returns>
    /// <response code="200">Returns a list of projects</response>
    [HttpGet]
    [ProducesResponseType(typeof(List<ProjectResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetProjects()
    {
        return HandleResult(await Mediator.Send(new AdminProjectList.Query()));
    }

    /// <summary>
    ///     Fetches the given project's info
    /// </summary>
    /// <remarks>
    ///     **Admin only**
    /// </remarks>
    /// <returns>The project for the ID</returns>
    /// <response code="200">Returns a list of projects</response>
    /// <response code="404">Project not found</response>
    [HttpGet("{id:guid}")]
    [ProducesResponseType(typeof(ProjectResponse), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetProjectDetails(Guid id)
    {
        return HandleResult(await Mediator.Send(new AdminGetProject.Query { Id = id }));
    }

    /// <summary>
    ///     Fetches the given project's scenarios
    /// </summary>
    /// <remarks>
    ///     **Admin only**
    /// </remarks>
    /// <returns>The scenarios for the ID</returns>
    /// <response code="200">Returns a list of scenarios</response>
    [HttpGet("{id:guid}/scenarios")]
    [ProducesResponseType(typeof(ScenarioResponse), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetProjectScenarios(Guid id)
    {
        return HandleResult(await Mediator.Send(new ScenarioList.Query { ProjectId = id }));
    }

    /// <summary>
    ///     Fetches the given scenario's steps
    /// </summary>
    /// <remarks>
    ///     **Admin only**
    /// </remarks>
    /// <returns>The steps for the ID</returns>
    /// <response code="200">Returns a list of steps</response>
    [HttpGet("/api/admin/scenarios/{id:guid}/steps")]
    [ProducesResponseType(typeof(StepResponse), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetScenarioSteps(Guid id)
    {
        return HandleResult(await Mediator.Send(new List.Query { ScenarioId = id }));
    }
}
