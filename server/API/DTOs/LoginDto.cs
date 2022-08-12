using System.ComponentModel;

namespace API.DTOs;

[DisplayName("LoginDto")]
public class LoginDto
{
    public string? Email { get; set; }
    public string? Password { get; set; }
}
