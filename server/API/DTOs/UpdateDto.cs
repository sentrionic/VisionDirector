using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Domain;

namespace API.DTOs;

[DisplayName("UpdateDto")]
public class UpdateDto
{
    [Required] public string? UserName { get; set; }

    [Required] [EmailAddress] public string? Email { get; set; }
}