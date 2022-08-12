using System.Text.Json.Serialization;
using Application.Common;
using Application.Core;
using Application.Interfaces;
using Application.Steps;
using FluentValidation;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Scenarios;

/// <summary>
///     Uploads a video for the given scenario ID
/// </summary>
public class UploadVideo
{
    public class Command : IRequest<Result<GenericResponse>?>
    {
        [JsonIgnore] public Guid Id { get; set; }

        public IFormFile? File { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        private const int Limit = 1000 * 1000 * 1000; // 1GB

        public CommandValidator()
        {
            RuleFor(x => x.File).NotNull();
            RuleFor(x => x.File!.Length).NotNull().LessThanOrEqualTo(Limit).WithMessage("File is too big");
            RuleFor(x => x.File!.ContentType).NotNull().Must(x => x.Contains("video"));
        }
    }

    public class Handler : IRequestHandler<Command, Result<GenericResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMediaAccessor _mediaAccessor;

        public Handler(DataContext context, IMediaAccessor mediaAccessor)
        {
            _mediaAccessor = mediaAccessor;
            _context = context;
        }

        public async Task<Result<GenericResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var scenario = await _context.Scenarios
                .Include(x => x.Project)
                .Where(x => x.Id == request.Id)
                .FirstOrDefaultAsync(cancellationToken);

            if (scenario == null)
            {
                return null;
            }

            // Upload the file
            var filename = StepUtils.GetFileName(scenario.Name!, request.File!);
            var video = await _mediaAccessor.UploadMedia(scenario.Project!.Id, request.File!, filename, scenario.Id);

            if (video == null)
            {
                return Result<GenericResponse>.Failure("Problem uploading video");
            }

            scenario.Url = video.FileUrl;

            var result = await _context.SaveChangesAsync(cancellationToken) > 0;

            return result
                ? Result<GenericResponse>.Success(new GenericResponse(video.FileUrl!))
                : Result<GenericResponse>.Failure("Problem uploading video");
        }
    }
}
