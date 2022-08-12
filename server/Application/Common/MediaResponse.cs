using System.ComponentModel;

namespace Application.Common;

/// <summary>
///     The media DTO.
/// </summary>
[DisplayName("MediaResponse")]
public class MediaResponse
{
    public string? FileUrl { get; set; }
    public string? MimeType { get; set; }
    public string? FileName { get; set; }
}
