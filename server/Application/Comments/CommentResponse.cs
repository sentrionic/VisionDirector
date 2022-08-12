using System.ComponentModel;
using Application.Common;

namespace Application.Comments;

/// <summary>
///     The comment DTO.
/// </summary>
[DisplayName("CommentResponse")]
public class CommentResponse
{
    public Guid Id { get; set; }
    public DateTime CreatedAt { get; set; }
    public string? Body { get; set; }
    public Collaborator? Author { get; set; }
}
