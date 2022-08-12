using Application.Interfaces;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;

namespace Infrastructure.Media;

public class MediaAccessor : IMediaAccessor
{
    private readonly IHttpContextAccessor _contextAccessor;
    private readonly IWebHostEnvironment _webHostEnvironment;

    public MediaAccessor(IWebHostEnvironment hostingEnvironment, IHttpContextAccessor contextAccessor)
    {
        _webHostEnvironment = hostingEnvironment;
        _contextAccessor = contextAccessor;
    }

    public async Task<Domain.Media?> UploadMedia(Guid projectId, IFormFile file, string filename, Guid? scenarioId = null)
    {
        if (file.Length <= 0)
        {
            return null;
        }

        await using var stream = file.OpenReadStream();

        var directory = Path.Combine(_webHostEnvironment.ContentRootPath, "wwwroot", "media", projectId.ToString());

        if (scenarioId != null) directory = Path.Combine(directory, scenarioId.ToString()!);
        
        Directory.CreateDirectory(directory);

        var filePath = Path.Combine(directory, filename);

        // Save to local media directory
        await using (Stream fileStream = new FileStream(filePath, FileMode.Create))
        {
            await file.CopyToAsync(fileStream);
        }

        // Get the current host address
        var request = _contextAccessor.HttpContext?.Request;

        // TODO: Possible to get port from reverse proxy? Change to your specified port
        var domain = $"{request?.Scheme}://{request?.Host}";

        var url = $"{domain}/media/{projectId}{(scenarioId != null ? $"/{scenarioId}" : "")}/{filename}";
        return new Domain.Media
        {
            FileName = filename,
            FileUrl = url,
            MimeType = file.ContentType
        };
    }

    public void DeleteMedia(Guid projectId, string fileName, Guid? scenarioId = null)
    {
        // Get the file name from the url
        var filePath = Path.Combine(
            _webHostEnvironment.ContentRootPath,
            "wwwroot",
            "media",
            $"{projectId}"
        );

        if (scenarioId != null)
        {
            filePath = Path.Combine(scenarioId.ToString()!, fileName);
        }

        filePath = Path.Combine(filePath, fileName);

        File.Delete(filePath);
    }
}
