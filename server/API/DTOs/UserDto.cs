using System.ComponentModel;

namespace API.DTOs;

[DisplayName("UserDto")]
public class UserDto
{
    public string? Id { get; set; }
    public string? Username { get; set; }
    public string? Email { get; set; }
    public string? Role { get; set; }
}
