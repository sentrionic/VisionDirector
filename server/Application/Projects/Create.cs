using System.ComponentModel;
using Application.Core;
using AutoMapper;
using Domain;
using FluentValidation;
using MediatR;
using Persistence;

namespace Application.Projects;

/// <summary>
///     Creates a new project
/// </summary>
public class Create
{
    [DisplayName("ProjectInput")]
    public class Command : IRequest<Result<ProjectResponse>>
    {
        public string? Name { get; set; }
    }

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(30);
        }
    }

    public class Handler : IRequestHandler<Command, Result<ProjectResponse>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<ProjectResponse>> Handle(Command request, CancellationToken cancellationToken)
        {
            var project = new Project { Name = request.Name?.Trim() };

            _context.Projects.Add(project);

            try
            {
                var result = await _context.SaveChangesAsync(cancellationToken) > 0;
                return result
                    ? Result<ProjectResponse>.Success(_mapper.Map<Project, ProjectResponse>(project))
                    : Result<ProjectResponse>.Failure("Failed to create project");
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                return Result<ProjectResponse>.Failure("Failed to create project");
            }
        }
    }
}
