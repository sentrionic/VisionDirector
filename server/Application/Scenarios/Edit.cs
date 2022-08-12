using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using Application.Core;
using AutoMapper;
using Domain;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Scenarios;

/// <summary>
///     Edits the scenario for the given ID
/// </summary>
public class Edit
{
    [DisplayName("EditScenarioInput")]
    public class Command : IRequest<Result<ScenarioResponse>?>
    {
        [JsonIgnore] public Guid Id { get; set; }

        public string? Name { get; set; }
        public string? Description { get; set; }
        [EnumDataType(typeof(Status))] public Status? Status { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(30);
            RuleFor(x => x.Description).MaximumLength(2000).When(x => x.Description != null);
        }
    }

    public class Handler : IRequestHandler<Command, Result<ScenarioResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<ScenarioResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var scenario = await _context.Scenarios
                .Where(x => x.Id == request.Id)
                .Include(x => x.Steps)
                .Include(x => x.Owner)
                .FirstOrDefaultAsync(cancellationToken);

            if (scenario == null)
            {
                return null;
            }

            // Update the values that are not null
            scenario.Name = request.Name?.Trim() ?? scenario.Name;
            scenario.Description = request.Description?.Trim() ?? scenario.Description;
            scenario.Status = request.Status ?? scenario.Status;
            scenario.UpdatedAt = DateTime.Now;

            var result = await _context.SaveChangesAsync(cancellationToken) > 0;

            return result
                ? Result<ScenarioResponse>.Success(_mapper.Map<Scenario, ScenarioResponse>(scenario))
                : Result<ScenarioResponse>.Failure("Failed to update scenario");
        }
    }
}
