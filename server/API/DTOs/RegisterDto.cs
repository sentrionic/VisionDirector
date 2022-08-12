using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Domain;

namespace API.DTOs;

[DisplayName("RegisterDto")]
public class RegisterDto
{
    [Required] public string? UserName { get; set; }

    [Required] [EmailAddress] public string? Email { get; set; }

    [Required] [MinLength(6)] public string? Password { get; set; }

    [EnumDataType(typeof(AppRoles))] public AppRoles Role { get; set; } = AppRoles.User;
}
