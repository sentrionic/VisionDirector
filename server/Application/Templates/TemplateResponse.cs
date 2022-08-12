using System.ComponentModel;
using Application.Common;
using Microsoft.AspNetCore.Http;

namespace Application.Templates;

/// <summary>
///     The template DTO.
/// </summary>
[DisplayName("TemplateResponse")]
public class TemplateResponse
{
    public Guid Id { get; set; }
    public Guid? ProjectId { get; set; }
    public string? Name { get; set; }
    public string? Description { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    public DateTime UpdatedAt { get; set; } = DateTime.Now;
    public ICollection<TemplateStepResponse> Steps { get; set; } = new List<TemplateStepResponse>();
}

/// <summary>
///     The template step DTO.
/// </summary>
[DisplayName("TemplateStepResponse")]
public class TemplateStepResponse
{
    public Guid Id { get; set; }
    public string? Name { get; set; }
    public int Duration { get; set; }
    public int Position { get; set; }
    public MediaResponse? Media { get; set; }
}

/// <summary>
///     The template step DTO.
/// </summary>
[DisplayName("TemplateStepDto")]
public class TemplateStepDto
{
    public Guid Id { get; set; }
    public string? Name { get; set; }
    public int Duration { get; set; }
    public int Position { get; set; }
    public IFormFile? Media { get; set; }
}
