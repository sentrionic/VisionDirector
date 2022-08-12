using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace API.DTOs;

[DisplayName("ChangePasswordDto")]
public class ChangePasswordDto
{
    [Required] [MinLength(6)] public string? CurrentPassword { get; set; }

    [Required] [MinLength(6)] public string? NewPassword { get; set; }

    [Required]
    [MinLength(6)]
    [Compare("NewPassword")]
    public string? ConfirmNewPassword { get; set; }
}
