using System.ComponentModel;
using System.Text.Json.Serialization;
using Application.Core;
using Application.Interfaces;
using AutoMapper;
using Domain;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;
using Task = Domain.Task;

namespace Application.Steps;

/// <summary>
///     Creates a step for the given scenario
/// </summary>
public class Create
{
    [DisplayName("CreateStepInput")]
    public class Command : IRequest<Result<List<StepResponse>>?>
    {
        [JsonIgnore] public Guid ScenarioId { get; set; }
        public List<CreateStepDto>? Steps { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Steps).NotNull().NotEmpty();
            RuleForEach(x => x.Steps).SetValidator(new StepValidator());
        }
    }

    public class Handler : IRequestHandler<Command, Result<List<StepResponse>>?>
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

        public async Task<Result<List<StepResponse>>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var scenario = await _context.Scenarios
                .Include(x => x.Steps)
                .FirstOrDefaultAsync(x => x.Id == request.ScenarioId, cancellationToken);

            if (scenario == null)
            {
                return null;
            }
            
            const int maxNumberSteps = 20;

            var stepCount = scenario.Steps.Count;
            var requestCount = request.Steps?.Count ?? 0;
            var sum = stepCount + requestCount;
            if (sum > maxNumberSteps)
            {
                return Result<List<StepResponse>>.Failure(
                    $"The maximum number of steps is {maxNumberSteps}. There are currently already {stepCount} steps " +
                    $"and you are trying to add {requestCount}. Please remove {sum - maxNumberSteps} steps."
                );
            }

            // Save the time before any step got created
            var currentTime = DateTime.Now;

            // Create all steps
            foreach (var dto in request.Steps!)
            {
                var step = new Step
                {
                    Name = dto.Name?.Trim(),
                    Annotation = dto.Annotation,
                    Duration = dto.Duration,
                    Position = scenario.Steps.Count,
                    Scenario = scenario
                };

                // Upload files if they exist
                if (dto.MediaFile != null)
                {
                    var filename = StepUtils.GetFileName(step.Name!, dto.MediaFile!);
                    var media = await _mediaAccessor.UploadMedia(scenario.ProjectId, dto.MediaFile,
                        filename, scenario.Id);
                    step.Media = media;

                    // Videos have an additional thumbnail sent
                    if (dto.Thumbnail != null && dto.MediaFile.ContentType.Contains("video"))
                    {
                        var thumbnailName = StepUtils.GetFileName($"{step.Name}-thumbnail", dto.Thumbnail!);
                        var thumbnail = await _mediaAccessor.UploadMedia(scenario.ProjectId,
                            dto.Thumbnail, thumbnailName, scenario.Id);
                        step.Thumbnail = thumbnail?.FileUrl;
                    }
                    // If Image, just use the image itself
                    else if (dto.MediaFile.ContentType.Contains("image"))
                    {
                        step.Thumbnail = media?.FileUrl;
                    }
                }

                if (dto.AudioFile != null)
                {
                    var filename = StepUtils.GetFileName(step.Name!, dto.AudioFile!);
                    var audio = await _mediaAccessor.UploadMedia(scenario.ProjectId, dto.AudioFile,
                        filename, scenario.Id);
                    step.Audio = audio;
                }

                // Create a task with the given step and assignee if they exist
                var task = new Task
                {
                    Title = step.Name,
                    Step = step,
                    Scenario = scenario,
                    IsMain = true,
                };

                if (dto.Assignee != null)
                {
                    var assignee = await _context.Users.FirstOrDefaultAsync(x => x.Id == dto.Assignee.ToString(),
                        cancellationToken);
                    task.Assignee = assignee;
                }

                scenario.Tasks.Add(task);
                scenario.Steps.Add(step);
            }

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            // Get the newly created steps using currentTime
            var steps = await _context.Steps
                .Where(x => x.Scenario!.Id == request.ScenarioId)
                .Where(x => x.CreatedAt > currentTime)
                .OrderBy(x => x.Position)
                .ToListAsync(cancellationToken);

            var results = steps.Select(step =>
            {
                var mainTask = _context.Tasks
                    .Include(x => x.Assignee)
                    .FirstOrDefaultAsync(x => x.IsMain, cancellationToken).Result;
                var dto = StepResponse.ToResponse(step, _mapper, mainTask?.Assignee, mainTask?.Completed ?? false);
                return dto;
            }).ToList();

            return success
                ? Result<List<StepResponse>>.Success(results)
                : Result<List<StepResponse>>.Failure("Failed to add step");
        }
    }
}
