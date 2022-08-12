using Domain;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Task = Domain.Task;

namespace Persistence;

/// <summary>
///     Setups the Entity Framework database context for injection and usage
/// </summary>
public class DataContext : IdentityDbContext<AppUser>
{
    public DataContext(DbContextOptions options) : base(options)
    {
    }

    public DbSet<Project> Projects { get; set; } = null!;
    public DbSet<Scenario> Scenarios { get; set; } = null!;
    public DbSet<Step> Steps { get; set; } = null!;
    public DbSet<Task> Tasks { get; set; } = null!;
    public DbSet<Media> Media { get; set; } = null!;
    public DbSet<Collaborators> Collaborators { get; set; } = null!;
    public DbSet<Comment> Comments { get; set; } = null!;
    public DbSet<Template> Templates { get; set; } = null!;
    public DbSet<TemplateStep> TemplateSteps { get; set; } = null!;

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.Entity<Project>()
            .HasIndex(u => u.Name)
            .IsUnique();

        builder.Entity<Collaborators>(x => x.HasKey(pc => new { pc.AppUserId, pc.ProjectId }));

        builder.Entity<Collaborators>()
            .HasOne(pc => pc.AppUser)
            .WithMany(a => a.Projects)
            .HasForeignKey(pc => pc.AppUserId);

        builder.Entity<Collaborators>()
            .HasOne(pc => pc.Project)
            .WithMany(p => p.Collaborators)
            .HasForeignKey(pc => pc.ProjectId);

        builder.Entity<Scenario>()
            .HasOne(s => s.Project)
            .WithMany(p => p.Scenarios)
            .OnDelete(DeleteBehavior.Cascade);

        builder.Entity<Scenario>()
            .HasOne(s => s.Owner)
            .WithMany(p => p.Scenarios)
            .OnDelete(DeleteBehavior.Cascade);

        builder.Entity<Step>()
            .HasOne(s => s.Scenario)
            .WithMany(p => p.Steps)
            .OnDelete(DeleteBehavior.Cascade);

        builder.Entity<Task>()
            .HasOne(s => s.Scenario)
            .WithMany(p => p.Tasks)
            .OnDelete(DeleteBehavior.Cascade);

        builder.Entity<Comment>()
            .HasOne(c => c.Task)
            .WithMany(t => t.Comments)
            .OnDelete(DeleteBehavior.Cascade);

        builder.Entity<Template>()
            .HasIndex(u => u.Name)
            .IsUnique();

        builder.Entity<TemplateStep>()
            .HasOne(t => t.Template)
            .WithMany(t => t.Steps)
            .OnDelete(DeleteBehavior.Cascade);
        
        builder.Entity<TemplateStep>()
            .HasOne(t => t.Media)
            .WithMany()
            .OnDelete(DeleteBehavior.Cascade);
    }
}
