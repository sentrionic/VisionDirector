using System.ComponentModel;
using Domain;
using Microsoft.AspNetCore.Http;

namespace Application.Steps;

/// <summary>
///     Dto for creating a step
/// </summary>
[DisplayName("CreateStepDto")]
public class CreateStepDto
{
    public string? Name { get; set; }
    public string? Annotation { get; set; }
    public IFormFile? MediaFile { get; set; }
    public IFormFile? AudioFile { get; set; }
    public IFormFile? Thumbnail { get; set; }
    public int Duration { get; set; }
    public Guid? Assignee { get; set; }
}
