using Domain;
using Microsoft.AspNetCore.Http;

namespace Application.Interfaces;

/// <summary>
///     Interface to upload files to the storage
/// </summary>
public interface IMediaAccessor
{
    /// <summary>
    ///     Uploads the given file to the storage
    /// </summary>
    /// <param name="projectId">The id of the project</param>
    /// <param name="file">The file to be uploaded</param>
    /// <param name="filename">The name of the new file</param>
    /// <param name="scenarioId">The id of the scenario (optional)</param>
    /// <returns>An object containing the url of the file</returns>
    Task<Media?> UploadMedia(Guid projectId, IFormFile file, string filename, Guid? scenarioId = null);
    
    /// <summary>
    ///     Deletes the file from the storage
    /// </summary>
    /// <param name="projectId">The id of the project</param>
    /// <param name="filename">The name of the file</param>
    /// <param name="scenarioId">The id of the scenario (optional)</param>
    void DeleteMedia(Guid projectId, string filename, Guid? scenarioId = null);
}
