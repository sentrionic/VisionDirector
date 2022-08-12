using System.Text.Json.Serialization;
using Application.Core;
using AutoMapper;
using Domain;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Templates;

/// <summary>
///     Delete the template with the given ID
/// </summary>
public class Delete
{
    public class Command : IRequest<Result<TemplateResponse>?>
    {
        [JsonIgnore] public Guid TemplateId { get; set; }
    }

    public class Handler : IRequestHandler<Command, Result<TemplateResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<TemplateResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var template = await _context.Templates
                .FirstOrDefaultAsync(x => x.Id == request.TemplateId, cancellationToken);

            if (template == null)
            {
                return null;
            }

            // Template is a default one
            if (template.ProjectId == null)
            {
                return Result<TemplateResponse>.Failure("Not allowed to delete a default template");
            }

            _context.Remove(template);

            var success = await _context.SaveChangesAsync(cancellationToken) > 0;

            return success
                ? Result<TemplateResponse>.Success(_mapper.Map<Template, TemplateResponse>(template))
                : Result<TemplateResponse>.Failure("Failed to delete the template");
        }
    }
}
