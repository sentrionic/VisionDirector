using Application.Core;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class BaseApiController : ControllerBase
{
    private IMediator? _mediator;

    protected IMediator Mediator => (_mediator ??= HttpContext.RequestServices
        .GetService<IMediator>()) ?? throw new InvalidOperationException();

    /// <summary>
    ///     Handles the Application return object and returns either success or failure.
    /// </summary>
    /// <param name="result">The result object</param>
    /// <typeparam name="T">Result DTO</typeparam>
    /// <returns>Result of an action method</returns>
    protected ActionResult HandleResult<T>(Result<T>? result)
    {
        if (result == null)
        {
            return NotFound();
        }

        return result.IsSuccess switch
        {
            true when result.Value != null => Ok(result.Value),
            true when result.Value == null => NotFound(),
            _ => BadRequest(result.Error)
        };
    }

    /// <summary>
    ///     Similar to HandleResult but makes it so that the success values only get sent via SignalR.
    ///     Errors get returned over Http. Success returns Unit.
    /// </summary>
    /// <param name="hub">The SignalR Hub</param>
    /// <param name="result">The result object from the Command</param>
    /// <param name="id">The scenario id the result should get send to</param>
    /// <param name="method">The name of the method to invoke on the client</param>
    /// <param name="isNonUnit">True if the actual result should be returned over Http instead of Unit</param>
    /// <typeparam name="T">Result DTO</typeparam>
    /// <typeparam name="TS">The IHubContext</typeparam>
    /// <returns>Result of an action method</returns>
    protected async Task<ActionResult> HandleHubResult<T, TS>(IHubContext<TS> hub, Result<T>? result, string id, string method,
        bool isNonUnit = false) where TS : Hub
    {
        if (result == null)
        {
            return NotFound();
        }

        var isSuccess = result is { IsSuccess: true };

        if (isSuccess)
        {
            await hub.Clients.Group(id).SendAsync(method, result.Value);
        }

        return isSuccess ? Ok(isNonUnit ? result.Value : Unit.Value) : BadRequest(result.Error);
    }
}
