namespace Application.Core;

/// <summary>
///     The application error response model.
/// </summary>
public class AppException
{
    public AppException(int statusCode, string message, string? details = null)
    {
        StatusCode = statusCode;
        Message = message;
        Details = details;
    }

    private int StatusCode { get; }
    private string Message { get; }
    private string? Details { get; }
}
