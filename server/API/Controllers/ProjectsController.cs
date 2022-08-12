using Application.Common;
using Application.Projects;
using Microsoft.AspNetCore.Mvc;
using Create = Application.Projects.Create;

namespace API.Controllers;

[Produces("application/json")]
public class ProjectsController : BaseApiController
{
    /// <summary>
    ///     Fetches the current user's projects
    /// </summary>
    /// <returns>A list of projects</returns>
    /// <response code="200">Returns a list of projects</response>
    [HttpGet]
    [Authorize]
    [ProducesResponseType(typeof(List<ProjectResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetProjects()
    {
        return HandleResult(await Mediator.Send(new ProjectList.Query()));
    }

    /// <summary>
    ///     Creates a new project.
    /// </summary>
    /// <remarks>
    ///     **Admin only**
    /// 
    ///     Sample request:
    /// 
    ///     POST /api/projects
    ///         {
    ///             "name": "Project Name"
    ///         }
    /// </remarks>
    /// <returns>The newly created project</returns>
    /// <response code="201">The newly created project</response>
    /// <response code="400">Validation fails</response>
    [HttpPost]
    [Authorize(Policy = Constants.IsAdmin)]
    [ProducesResponseType(typeof(ProjectResponse), StatusCodes.Status201Created)]
    public async Task<IActionResult> CreateProject(Create.Command command)
    {
        return HandleResult(await Mediator.Send(command));
    }

    /// <summary>
    ///     Generates an invite for the project.
    /// </summary>
    /// <remarks>
    ///     **Admin only**
    /// </remarks>
    /// <returns>The generated invite</returns>
    /// <response code="201">The created invite</response>
    [HttpPost("{id:guid}/invite")]
    [Authorize(Policy = Constants.IsAdmin)]
    [ProducesResponseType(typeof(GenericResponse), StatusCodes.Status201Created)]
    public async Task<IActionResult> GenerateInvite(Guid id, GenerateInvite.Command command)
    {
        command.ProjectId = id;
        return HandleResult(await Mediator.Send(command));
    }

    /// <summary>
    ///     Fetches the project's collaborators
    /// </summary>
    /// <returns>A list of collaborators</returns>
    /// <response code="200">Returns a list of collaborators</response>
    [HttpGet("{id:guid}/members")]
    [Authorize(Policy = Constants.IsProjectCollaborator)]
    [ProducesResponseType(typeof(List<Collaborator>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetCollaborators(Guid id)
    {
        return HandleResult(await Mediator.Send(new ListCollaborators.Query { ProjectId = id }));
    }

    /// <summary>
    ///     Joins the project
    /// </summary>
    /// <remarks>
    ///     Sample request:
    /// 
    ///     POST /api/projects/join
    ///         {
    ///             "token": "token"
    ///         }
    /// </remarks>
    /// <returns>The newly joined project</returns>
    /// <response code="201">The newly joined project</response>
    /// <response code="400">Validation fails</response>
    [HttpPost("join")]
    [Authorize]
    [ProducesResponseType(typeof(ProjectResponse), StatusCodes.Status201Created)]
    public async Task<IActionResult> JoinProject(JoinProject.Command command)
    {
        return HandleResult(await Mediator.Send(command));
    }

    /// <summary>
    ///     Adds members to the project
    /// </summary>
    /// <remarks>
    ///     **Admin only**
    /// 
    ///     Sample request:
    /// 
    ///     POST /api/projects/{id}/members
    ///         {
    ///             "ids": ["id1", "id2"]
    ///         }
    /// </remarks>
    /// <returns>The newly joined project</returns>
    /// <response code="400">Validation fails</response>
    [HttpPost("{id:guid}/members")]
    [Authorize(Policy = Constants.IsAdmin)]
    public async Task<IActionResult> AddMembers(AddMember.Command command, Guid id)
    {
        command.ProjectId = id;
        return HandleResult(await Mediator.Send(command));
    }
}
