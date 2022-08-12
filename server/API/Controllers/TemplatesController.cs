using Application.Admin;
using Application.Templates;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[Produces("application/json")]
public class TemplatesController : BaseApiController
{
    /// <summary>
    ///     Fetches the templates of the project with the given id
    /// </summary>
    /// <returns>A list of templates</returns>
    /// <response code="200">Returns a list of templates</response>
    [HttpGet("/api/projects/{id:guid}/templates")]
    [Authorize(Policy = Constants.IsProjectCollaborator)]
    [ProducesResponseType(typeof(List<TemplateResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetTemplates(Guid id)
    {
        return HandleResult(await Mediator.Send(new List.Query { ProjectId = id }));
    }

    /// <summary>
    ///     Creates a new template.
    /// </summary>
    /// <remarks>
    ///     **Engineer Only**
    /// 
    ///     Sample request:
    /// 
    ///     POST /api/templates
    /// 
    /// </remarks>
    /// <returns>The newly created scenario</returns>
    /// <response code="201">The newly created scenario</response>
    /// <response code="400">Validation fails</response>
    [HttpPost]
    [Authorize(Policy = Constants.IsEngineerOrAdmin)]
    [ProducesResponseType(typeof(TemplateResponse), StatusCodes.Status201Created)]
    [DisableRequestSizeLimit]
    public async Task<IActionResult> CreateTemplate(Create.Command command)
    {
        return HandleResult(await Mediator.Send(command));
    }

    /// <summary>
    ///     Creates a new template out of the given scenario.
    /// </summary>
    /// <remarks>
    ///     **Engineer Only**
    /// 
    ///     Sample request:
    /// 
    ///     POST /api/templates/{scenarioId}
    /// 
    /// </remarks>
    /// <returns>The newly created scenario</returns>
    /// <response code="201"></response>
    /// <response code="400">Validation fails</response>
    [HttpPost("{scenarioId:guid}")]
    [Authorize(Policy = Constants.IsEngineerOrAdmin)]
    [ProducesResponseType(typeof(Unit), StatusCodes.Status201Created)]
    public async Task<IActionResult> MakeTemplate(Guid scenarioId, MakeTemplate.Command command)
    {
        command.ScenarioId = scenarioId;
        return HandleResult(await Mediator.Send(command));
    }

    /// <summary>
    ///     Fetches all templates
    /// </summary>
    /// <returns>A list of templates</returns>
    /// <response code="200">Returns a list of templates</response>
    [HttpGet]
    [Authorize(Policy = Constants.IsEngineerOrAdmin)]
    [ProducesResponseType(typeof(List<TemplateResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetAllTemplates()
    {
        return HandleResult(await Mediator.Send(new AdminGetTemplates.Query()));
    }

    /// <summary>
    ///     Updates the given template
    /// </summary>
    /// <returns>The updated template</returns>
    /// <response code="200">The updated template</response>
    [HttpPut("{id:guid}")]
    [Authorize(Policy = Constants.IsEngineerOrAdmin)]
    [ProducesResponseType(typeof(TemplateResponse), StatusCodes.Status200OK)]
    [DisableRequestSizeLimit]
    public async Task<IActionResult> UpdateTemplate(Guid id, [FromForm] Edit.Command command)
    {
        command.TemplateId = id;
        return HandleResult(await Mediator.Send(command));
    }

    /// <summary>
    ///     Deletes the template for the given ID
    /// </summary>
    /// <returns>The deleted template</returns>
    /// <response code="200">The deleted template</response>
    [HttpDelete("{id:guid}")]
    [Authorize(Policy = Constants.IsEngineerOrAdmin)]
    [ProducesResponseType(typeof(TemplateResponse), StatusCodes.Status200OK)]
    public async Task<IActionResult> DeleteTemplate(Guid id)
    {
        return HandleResult(await Mediator.Send(new Delete.Command { TemplateId = id }));
    }

    /// <summary>
    ///     Deletes the template step for the given ID
    /// </summary>
    /// <returns>The deleted template step</returns>
    /// <response code="200">The deleted template step</response>
    [HttpDelete("{id:guid}/{stepId:guid}")]
    [Authorize(Policy = Constants.IsEngineerOrAdmin)]
    [ProducesResponseType(typeof(TemplateResponse), StatusCodes.Status200OK)]
    public async Task<IActionResult> DeleteTemplateStep(Guid id, Guid stepId)
    {
        return HandleResult(await Mediator.Send(new DeleteTemplateStep.Command { TemplateId = id, StepId = stepId }));
    }
}
