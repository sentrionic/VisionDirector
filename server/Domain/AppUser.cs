using Microsoft.AspNetCore.Identity;

namespace Domain;

/// <summary>
///     The application user
/// </summary>
public class AppUser : IdentityUser
{
    public ICollection<Collaborators>? Projects { get; set; }
    public ICollection<Scenario>? Scenarios { get; set; }
}
