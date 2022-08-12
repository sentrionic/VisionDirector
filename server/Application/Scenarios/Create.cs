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

namespace Application.Scenarios;

/// <summary>
///     Creates a scenario for the given project
/// </summary>
public class CreateScenario
{
    [DisplayName("CreateScenarioInput")]
    public class Command : IRequest<Result<ScenarioResponse>?>
    {
        public string Name { get; set; } = string.Empty;

        [JsonIgnore] public Guid ProjectId { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(30);
        }
    }

    public class Handler : IRequestHandler<Command, Result<ScenarioResponse>?>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly IUserAccessor _userAccessor;

        public Handler(DataContext context, IUserAccessor userAccessor, IMapper mapper)
        {
            _context = context;
            _userAccessor = userAccessor;
            _mapper = mapper;
        }

        public async Task<Result<ScenarioResponse>?> Handle(Command request, CancellationToken cancellationToken)
        {
            var project = await _context.Projects.FindAsync(new object?[] { request.ProjectId }, cancellationToken);

            if (project == null)
            {
                return null;
            }

            var user = await _context.Users.FirstOrDefaultAsync(x => x.Id == _userAccessor.GetUserId(),
                cancellationToken);

            if (user == null)
            {
                return null;
            }

            var scenario = new Scenario
            {
                Name = request.Name.Trim(), 
                Owner = user, 
                Project = project
            };

            _context.Scenarios.Add(scenario);

            var result = await _context.SaveChangesAsync(cancellationToken) > 0;

            return result
                ? Result<ScenarioResponse>.Success(_mapper.Map<Scenario, ScenarioResponse>(scenario,
                    opt => opt.AfterMap((_, dest) => dest.IsOwner = true)))
                : Result<ScenarioResponse>.Failure("Failed to create scenario");
        }
    }
}
