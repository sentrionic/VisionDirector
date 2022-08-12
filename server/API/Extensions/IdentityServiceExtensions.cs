using System.Text;
using API.Services;
using Domain;
using Infrastructure.Security;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Persistence;
using Task = System.Threading.Tasks.Task;

namespace API.Extensions;

public static class IdentityServiceExtensions
{
    public static void AddIdentityServices(this IServiceCollection services,
        IConfiguration config)
    {
        services.AddIdentityCore<AppUser>(opt =>
            {
                // Allow weak passwords to simplify 
                opt.Password.RequireLowercase = false;
                opt.Password.RequireUppercase = false;
                opt.Password.RequireDigit = false;
                opt.Password.RequiredUniqueChars = 0;
                opt.Password.RequireNonAlphanumeric = false;

                // Allow spaces and dashes
                opt.User.AllowedUserNameCharacters =
                    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_ ";
            })
            .AddRoles<IdentityRole>()
            .AddEntityFrameworkStores<DataContext>()
            .AddSignInManager<SignInManager<AppUser>>();

        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(config["TokenKey"]));

        // JWT authentication
        services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(opt =>
            {
                opt.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = key,
                    ValidateIssuer = false,
                    ValidateAudience = false
                };

                // SignalR authentication
                opt.Events = new JwtBearerEvents
                {
                    OnMessageReceived = context =>
                    {
                        var accessToken = context.Request.Query["access_token"];
                        var path = context.HttpContext.Request.Path;
                        if (!string.IsNullOrEmpty(accessToken) && (path.StartsWithSegments("/ws") || path.StartsWithSegments("/chat")))
                        {
                            context.Token = accessToken;
                        }

                        return Task.CompletedTask;
                    }
                };
            });

        // Add AuthorizationHandler
        services.AddAuthorization(opt =>
        {
            opt.AddPolicy(Constants.IsScenarioOwner, policy => { policy.Requirements.Add(new IsOwnerRequirement()); });
            opt.AddPolicy(Constants.IsAdmin, policy => { policy.Requirements.Add(new IsAdminRequirement()); });
            opt.AddPolicy(Constants.IsProjectCollaborator,
                policy => { policy.Requirements.Add(new IsProjectCollaboratorRequirement()); });
            opt.AddPolicy(Constants.IsScenarioCollaborator,
                policy => { policy.Requirements.Add(new IsScenarioCollaboratorRequirement()); });
            opt.AddPolicy(Constants.IsProjectHubCollaborator,
                policy => { policy.Requirements.Add(new IsCollaboratorHubRequirement()); });
            opt.AddPolicy(Constants.IsEngineer,
                policy => { policy.Requirements.Add(new IsEngineerRequirement()); });
            opt.AddPolicy(Constants.IsEngineerOrAdmin,
                policy => { policy.Requirements.Add(new IsEngineerOrAdminRequirement()); });
        });

        services.AddTransient<IAuthorizationHandler, IsOwnerRequirementHandler>();
        services.AddTransient<IAuthorizationHandler, IsAdminRequirementHandler>();
        services.AddTransient<IAuthorizationHandler, IsProjectCollaboratorRequirementHandler>();
        services.AddTransient<IAuthorizationHandler, IsScenarioCollaboratorRequirementHandler>();
        services.AddTransient<IAuthorizationHandler, IsCollaboratorHubRequirementHandler>();
        services.AddTransient<IAuthorizationHandler, IsEngineerRequirementHandler>();
        services.AddTransient<IAuthorizationHandler, IsEngineerOrAdminRequirementHandler>();

        services.AddScoped<TokenService>();
    }
}
