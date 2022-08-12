using Microsoft.AspNetCore.Http;

namespace Application.Steps;

public static class StepUtils
{
    /// <summary>
    /// Returns a cleaned name for the new file.
    /// It is of the format {step_name}_yyy-MM-dd_HH-mm-ss.{extension}.
    /// </summary>
    /// <param name="stepName">The name of the step</param>
    /// <param name="file">The to be stored file</param>
    /// <returns>The cleaned file name</returns>
    public static string GetFileName(string stepName, IFormFile file)
    {
        var date = DateTime.Now.ToString("yyyy-MM-dd_HH-mm-ss");
        var extension = file.FileName[file.FileName.LastIndexOf(".", StringComparison.Ordinal)..];
        return $"{stepName.ToLower().Replace(" ", "-")}_{date}{extension}";
    }

    /// <summary>
    /// Returns the filename from the url.
    /// </summary>
    /// <param name="url">The url of the file</param>
    /// <returns>Only the name part</returns>
    public static string GetFileNameFromUrl(string url)
    {
        return url[(url.LastIndexOf("/", StringComparison.Ordinal) + 1)..];
    }
}
