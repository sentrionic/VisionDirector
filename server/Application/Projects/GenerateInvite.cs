using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using Application.Common;
using Application.Core;
using Application.Interfaces;
using Domain;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Projects;

/// <summary>
///     Generates an invite for the given project
/// </summary>
public class GenerateInvite
{
    [DisplayName("GenerateInviteInput")]
    public class Command : IRequest<Result<GenericResponse?>?>
    {
        [JsonIgnore] public Guid ProjectId { get; set; }
        [EnumDataType(typeof(ExpirationDate))] public ExpirationDate Date { get; set; } = ExpirationDate.OneDay;
    }

    public class Handler : IRequestHandler<Command, Result<GenericResponse?>?>
    {
        private readonly ICacheAccessor _cacheAccessor;
        private readonly DataContext _context;

        public Handler(DataContext context, ICacheAccessor cacheAccessor)
        {
            _context = context;
            _cacheAccessor = cacheAccessor;
        }

        public async Task<Result<GenericResponse?>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var project =
                await _context.Projects.FirstOrDefaultAsync(x => x.Id == request.ProjectId, cancellationToken);

            if (project == null)
            {
                return null;
            }

            // Store the ID in the cache
            var token = await _cacheAccessor.GenerateInvite(project.Id.ToString(), request.Date);

            return token != null
                ? Result<GenericResponse?>.Success(new GenericResponse(token))
                : Result<GenericResponse?>.Failure("Failed to create invite");
        }
    }
}
