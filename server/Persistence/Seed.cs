using Domain;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Task = System.Threading.Tasks.Task;

namespace Persistence;

public class Seed
{
    public static async Task SeedData(IConfiguration config, DataContext context,
        UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager, bool isDevelopment)
    {
        // Create the roles
        if (!roleManager.Roles.Any())
        {
            var roles = (AppRoles[])Enum.GetValues(typeof(AppRoles));

            foreach (var role in roles)
            {
                var roleName = Enum.GetName(typeof(AppRoles), role);

                var roleExist = await roleManager.RoleExistsAsync(roleName);
                if (!roleExist)
                {
                    // create the roles and seed them to the database
                    await roleManager.CreateAsync(new IdentityRole(roleName));
                }
            }
        }

        // Create admin user
        var user = await userManager.FindByEmailAsync(config["AppSettings:UserEmail"]);

        if (user == null)
        {
            var admin = new AppUser
            {
                UserName = config["AppSettings:UserName"],
                Email = config["AppSettings:UserEmail"]
            };
            var password = config["AppSettings:UserPassword"];

            var result = await userManager.CreateAsync(admin, password);
            if (result.Succeeded)
            {
                // add the Admin role
                await userManager.AddToRoleAsync(admin, AppRoles.Admin.ToString());
            }
        }

        // Add default templates
        if (!context.Templates.Any())
        {
            // Story Matrix
            await context.Templates.AddAsync(new Template
            {
                Name = "Story Matrix",
                Description = @"This template represents the structure of a story matrix. It helps with telling a story the viewer can relate to.

                1. Introducing the user, their location and what they are currently doing.
                2. Introducing the conflict.
                3. What is the challenge and why does it cause problems?
                4. Lose of control. What does the user think / feel?
                5. How does the user feel?
                6. Definition of the solution.
                7. What is the solution?
                8. What are the results?
                9. What did the user gain?
                10. Takeaway",
                Steps = new List<TemplateStep>
                {
                    new() { Name = "Context", Position = 0, Duration = 15},
                    new() { Name = "Problem", Position = 1, Duration = 15},
                    new() { Name = "Challenge", Position = 2, Duration = 15},
                    new() { Name = "Crisis", Position = 3, Duration = 15},
                    new() { Name = "Low Point", Position = 4, Duration = 15},
                    new() { Name = "Solution Bringer", Position = 5, Duration = 15},
                    new() { Name = "Solution", Position = 6, Duration = 15},
                    new() { Name = "Results", Position = 7, Duration = 15},
                    new() { Name = "Improvements", Position = 8, Duration = 15},
                    new() { Name = "Takeaway", Position = 9, Duration = 15},
                }
            });
        }

        // Dummy Data
        if (isDevelopment && !context.Projects.Any())
        {
            var users = new List<AppUser>
            {
                new() { UserName = "Alice", Email = "alice@example.com" },
                new() { UserName = "Bob", Email = "bob@example.com" },
                new() { UserName = "Chris", Email = "chris@example.com" },
                new() { UserName = "Dan", Email = "dan@example.com" },
                new() { UserName = "Elsa", Email = "elsa@example.com" }
            };

            foreach (var appUser in users)
            {
                await userManager.CreateAsync(appUser, "password");
                await userManager.AddToRoleAsync(appUser, AppRoles.User.ToString());
            }

            var project = new Project
            {
                Name = "Vision Director",
                Collaborators = new List<Collaborators>
                {
                    new() { AppUser = users[0] }, new() { AppUser = users[1] }, new() { AppUser = users[2] }
                }
            };

            var scenario = new Scenario { Name = "Create Video", Project = project, Owner = users[0] };

            var steps = new List<Step>
            {
                new() { Name = "Step #1", Duration = 5, Position = 0 },
                new() { Name = "Step #2", Duration = 5, Position = 1 },
                new() { Name = "Step #3", Duration = 5, Position = 2 },
                new() { Name = "Step #4", Duration = 5, Position = 3 },
                new() { Name = "Step #5", Duration = 5, Position = 4 },
            };
            foreach (var step in steps) scenario.Steps.Add(step);

            var tasks = new List<Domain.Task>
            {
                new() { Title = "Task #1", Step = steps[0], Assignee = users[0], Scenario = scenario },
                new() { Title = "Task #2", Step = steps[1], Assignee = users[1], Scenario = scenario },
                new() { Title = "Task #3", Step = steps[2], Assignee = users[2], Scenario = scenario },
                new() { Title = "Task #4", Scenario = scenario },
            };
            foreach (var task in tasks) scenario.Tasks.Add(task);

            project.Scenarios.Add(scenario);

            await context.Projects.AddRangeAsync(project);
        }

        await context.SaveChangesAsync();
    }
}
