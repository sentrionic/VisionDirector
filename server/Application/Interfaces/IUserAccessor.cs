namespace Application.Interfaces;

public interface IUserAccessor
{
    /// <summary>
    ///     Returns the current user's ID
    /// </summary>
    /// <returns>The current user's ID</returns>
    string? GetUserId();
}
