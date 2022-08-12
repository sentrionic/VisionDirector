using System.ComponentModel;

namespace Application.Common;

/// <summary>
///     A response DTO containing whatever value
/// </summary>
[DisplayName("GenericResponse")]
public record GenericResponse(string Value);
