using System.ComponentModel;

namespace Application.Common;

/// <summary>
///     The project collaborator DTO.
/// </summary>
[DisplayName("Collaborator")]
public class Collaborator
{
    public string? Id { get; set; }
    public string? Username { get; set; }
    public string? Email { get; set; }
}
