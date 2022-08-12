namespace Application.Core;

/// <summary>
///     Return object containing either the error or the success value
/// </summary>
/// <typeparam name="T">Result Object</typeparam>
public class Result<T>
{
    public bool IsSuccess { get; set; }
    public T? Value { get; set; }
    public string? Error { get; set; }

    public static Result<T> Success(T value)
    {
        return new Result<T> { IsSuccess = true, Value = value };
    }

    public static Result<T> Failure(string error)
    {
        return new Result<T> { IsSuccess = false, Error = error };
    }
}
