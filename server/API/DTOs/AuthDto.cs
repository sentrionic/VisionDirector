using System.ComponentModel;

namespace API.DTOs;

[DisplayName("AuthDto")]
public class AuthDto
{
    public string? Token { get; set; }
    public UserDto? User { get; set; }
}
