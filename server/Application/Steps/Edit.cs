using System.ComponentModel;
using System.Text.Json.Serialization;
using Application.Core;
using Application.Interfaces;
using AutoMapper;
using Domain;
using FluentValidation;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Steps;

/// <summary>
///     Edits the step with the given ID
/// </summary>
public class Edit
{
    [DisplayName("EditStepInput")]
    public class Command : IRequest<Result<StepResponse>?>
    {
        [JsonIgnore] public Guid ScenarioId { get; set; }

        [JsonIgnore] public Guid StepId { get; set; }

        public string? Name { get; set; }
        public string? Annotation { get; set; }
        public IFormFile? MediaFile { get; set; }
        public IFormFile? AudioFile { get; set; }
        public IFormFile? Thumbnail { get; set; }
        public int Duration { get; set; }
        public Transition? Transition { get; set; }
        public Guid? Assignee { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(StepConstants.MaxNameLength);
            RuleFor(x => x.Annotation).MaximumLength(StepConstants.MaxAnnotationLength).When(x => x.Annotation != null);
            RuleFor(x => x.MediaFile!.Length).LessThanOrEqualTo(StepConstants.MaxFileSize).WithMessage("File is too big")
                .When(x => x.MediaFile != null);
            RuleFor(x => x.MediaFile!.ContentType).Must(x => x.Contains("video") || x.Contains("image"))
                .When(x => x.MediaFile != null);
            RuleFor(x => x.AudioFile!.ContentType).Must(x => x.Contains("audio")).When(x => x.AudioFile != null);
            RuleFor(x => x.Duration).GreaterThanOrEqualTo(StepConstants.MinDuration);
            RuleFor(x => x.Transition).IsInEnum().When(x => x.Transition != null);
        }
    }

    public class Handler : IRequestHandler<Command, Result<StepResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly IMediaAccessor _mediaAccessor;

        public Handler(DataContext context, IMapper mapper, IMediaAccessor mediaAccessor)
        {
            _mapper = mapper;
            _mediaAccessor = mediaAccessor;
            _context = context;
        }

        public async Task<Result<StepResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var step = await _context.Steps
                .Include(x => x.Media)
                .Include(x => x.Audio)
                .Include(x => x.Scenario)
                .FirstOrDefaultAsync(x => x.Id == request.StepId, cancellationToken);

            if (step == null)
            {
                return null;
            }

            // Update the values that are not null
            step.Name = request.Name;
            step.Annotation = request.Annotation ?? step.Annotation;
            step.Duration = request.Duration;
            step.Transition = request.Transition ?? step.Transition;
            step.UpdatedAt = DateTime.Now;

            // Upload media
            if (request.MediaFile != null)
            {
                var projectId = step.Scenario!.ProjectId;
                var scenarioId = step.Scenario!.Id;

                if (step.Media != null)
                {
                    _mediaAccessor.DeleteMedia(projectId, step.Media.FileName!, scenarioId);
                    var fileName = StepUtils.GetFileNameFromUrl(step.Thumbnail!);
                    _mediaAccessor.DeleteMedia(projectId, fileName, scenarioId);
                }

                var filename = StepUtils.GetFileName(step.Name!, request.MediaFile!);
                var media = await _mediaAccessor.UploadMedia(projectId, request.MediaFile, filename, scenarioId);
                step.Media = media;

                // Videos have an additional thumbnail sent
                if (request.Thumbnail != null && request.MediaFile.ContentType.Contains("video"))
                {
                    var thumbnailName = StepUtils.GetFileName($"{step.Name}-thumbnail", request.Thumbnail!);
                    var thumbnail = await _mediaAccessor.UploadMedia(projectId,
                        request.Thumbnail, thumbnailName, scenarioId);
                    step.Thumbnail = thumbnail?.FileUrl;
                }
                // If Image, just use the image itself
                else if (request.MediaFile.ContentType.Contains("image"))
                {
                    step.Thumbnail = media?.FileUrl;
                }
            }

            if (request.AudioFile != null)
            {
                var projectId = step.Scenario!.Project!.Id;
                var scenarioId = step.Scenario!.Id;

                if (step.Audio != null)
                {
                    _mediaAccessor.DeleteMedia(projectId, step.Audio.FileName!, scenarioId);
                }

                var filename = StepUtils.GetFileName(step.Name!, request.AudioFile!);
                var audio = await _mediaAccessor.UploadMedia(projectId, request.AudioFile, filename, scenarioId);
                step.Audio = audio;
            }

            var mainTask = _context.Tasks
                .Include(x => x.Assignee)
                .FirstOrDefaultAsync(x => x.IsMain && x.StepId == step.Id, cancellationToken).Result;

            // Update the title of the task if the name changed
            if (mainTask != null)
            {
                mainTask.Title = request.Name ?? mainTask.Title;
                mainTask.UpdatedAt = DateTime.Now;

                // Update the assignee if it changed
                if (request.Assignee != null)
                {
                    var assignee = await _context.Users.FirstOrDefaultAsync(x => x.Id == request.Assignee.ToString(),
                        cancellationToken);
                    mainTask.Assignee = assignee;
                }
            }

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            var dto = StepResponse.ToResponse(step, _mapper, mainTask?.Assignee, mainTask?.Completed ?? false);

            return success
                ? Result<StepResponse>.Success(dto)
                : Result<StepResponse>.Failure("Failed to update step");
        }
    }
}
