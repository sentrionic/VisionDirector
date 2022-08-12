using System.Text.Json.Serialization;
using Application.Core;
using Application.Interfaces;
using AutoMapper;
using Domain;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Templates;

/// <summary>
///     Delete the template step with the given ID
/// </summary>
public class DeleteTemplateStep
{
    public class Command : IRequest<Result<TemplateStepResponse>?>
    {
        [JsonIgnore] public Guid StepId { get; set; }
        [JsonIgnore] public Guid TemplateId { get; set; }
    }

    public class Handler : IRequestHandler<Command, Result<TemplateStepResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly IMediaAccessor _mediaAccessor;

        public Handler(DataContext context, IMapper mapper, IMediaAccessor mediaAccessor)
        {
            _context = context;
            _mapper = mapper;
            _mediaAccessor = mediaAccessor;
        }

        public async Task<Result<TemplateStepResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var step = await _context.TemplateSteps
                .Include(x => x.Media)
                .FirstOrDefaultAsync(x => x.Id == request.StepId, cancellationToken);

            if (step == null)
            {
                return null;
            }
            
            if (step.Media != null)
            {
                _mediaAccessor.DeleteMedia(request.TemplateId, step.Media.FileName!);
            }

            _context.Remove(step);

            // Move all steps after the current one back one position
            var steps = await _context.TemplateSteps.Where(x => x.TemplateId == request.TemplateId)
                .Where(x => x.Position > step.Position).ToListAsync(cancellationToken);

            foreach (var s in steps)
            {
                s.Position -= 1;
            }

            var result = await _context.SaveChangesAsync(cancellationToken) > 0;

            return result
                ? Result<TemplateStepResponse>.Success(_mapper.Map<TemplateStep, TemplateStepResponse>(step))
                : Result<TemplateStepResponse>.Failure("Failed to delete the step");
        }
    }
}
