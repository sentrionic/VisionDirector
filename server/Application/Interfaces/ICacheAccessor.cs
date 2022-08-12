using Domain;

namespace Application.Interfaces;

/// <summary>
///     Interface to access the Redis DB
/// </summary>
public interface ICacheAccessor
{
    /// <summary>
    ///     Creates an invite link for the given project ID that is valid for a day
    /// </summary>
    /// <param name="id">The project ID</param>
    /// <param name="date">The time the link will expire</param>
    /// <returns>A 5 digit invite token</returns>
    Task<string?> GenerateInvite(string id, ExpirationDate date);

    /// <summary>
    ///     Returns the project ID that is stored in the invite
    /// </summary>
    /// <param name="invite">The invite token</param>
    /// <returns>The project ID if found</returns>
    Task<string?> GetProjectFromInvite(string invite);
}
