using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

/// <summary>
///     Used for returning the admin board
/// </summary>
[AllowAnonymous]
public class FallbackController : Controller
{
    public IActionResult Index()
    {
        return PhysicalFile(Path.Combine(Directory.GetCurrentDirectory(),
            "wwwroot", "index.html"), "text/HTML");
    }
}
