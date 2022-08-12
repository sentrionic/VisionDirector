using System.Text.Json.Serialization;
using Application.Core;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Steps;

/// <summary>
///     Returns the step for the given ID
/// </summary>
public class Detail
{
    public class Query : IRequest<Result<StepResponse>?>
    {
        [JsonIgnore] public Guid StepId { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<StepResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;
        }

        public async Task<Result<StepResponse>?> Handle(Query request, CancellationToken cancellationToken)
        {
            var step = await _context.Steps
                .Where(x => x.Id == request.StepId)
                .Include(x => x.Media)
                .Include(x => x.Audio)
                .SingleOrDefaultAsync(cancellationToken);

            if (step == null)
            {
                return null;
            }

            var mainTask = _context.Tasks
                .Include(x => x.Assignee)
                .FirstOrDefaultAsync(x => x.IsMain && x.StepId == step.Id, cancellationToken).Result;
            var dto = StepResponse.ToResponse(step, _mapper, mainTask?.Assignee, mainTask?.Completed ?? false);

            return Result<StepResponse>.Success(dto);
        }
    }
}
