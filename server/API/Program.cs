using System.Text.Json.Serialization;
using API.Extensions;
using API.SignalR;
using Domain;
using FluentValidation.AspNetCore;
using Microsoft.EntityFrameworkCore;
using Persistence;

var builder = WebApplication.CreateBuilder(args);

// add services to container

builder.Services.AddControllers(opt =>
    {
        var policy = new AuthorizationPolicyBuilder().RequireAuthenticatedUser().Build();
        opt.Filters.Add(new AuthorizeFilter(policy));
    })
    .AddJsonOptions(options =>
        options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter()));

builder.Services.AddFluentValidationAutoValidation();

builder.Services.AddApplicationServices(builder.Configuration);
builder.Services.AddIdentityServices(builder.Configuration);

// Configure the http request pipeline

var app = builder.Build();

// // Create the media directory if it does not exist
var mediaDir = Path.Combine(app.Environment.ContentRootPath, "wwwroot/media");
Directory.CreateDirectory(mediaDir);


// Setups middlewares
app.UseForwardedHeaders();

app.UseMiddleware<ExceptionMiddleware>();

app.UseXContentTypeOptions();
app.UseReferrerPolicy(opt => opt.NoReferrer());
app.UseXXssProtection(opt => opt.EnabledWithBlockMode());
app.UseXfo(opt => opt.Deny());
app.UseCsp(opt => opt
    .BlockAllMixedContent()
    .StyleSources(s => s.Self().CustomSources(
        "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=",
        "sha256-TGjSkcFoVCRdq4Hp3hcETnPc9cikdBGvkz/08Bjzy0I=",
        "sha256-TGjSkcFoVCRdq4Hp3hcETnPc9cikdBGvkz/08Bjzy0I=",
        "sha256-wkAU1AW/h8YFx0XlzvpTllAKnFEO2tw8aKErs5a26LY=",
        "sha256-+t9sXBXO2hSWo5Lz23s3nOBddWxAxR1I1gVh5KU4Bcs=",
        "sha256-Bwqk4rufeXe1FIoaXZsktmncl+/EiOVhhM3qDw3dMyw=",
        "sha256-k9Ql9KxE2q55Cwa0JUHHUg0QOBPtvjMnCCFK2yb/1ZA=",
        "sha256-YAB72NTU8UiZZVYVnCEj+CjmfGqGxVZJdf2mw0zC+Vk=",
        "sha256-2WEKsebpTdKw+Br4fVe7v5Z5DzDLxN4tQ331QgOotRg=",
        "sha256-g/u7YioVU3U+b9o96foNBtOQLo6f+KKdLh7wEOCAoUU=",
        "sha256-F28IJgEWe5I+ef7ZEAoWWMC2+og+mXTFpJD0KZPTuxk="
    ))
    .FontSources(s => s.Self())
    .FormActions(s => s.Self())
    .FrameAncestors(s => s.Self())
    .ImageSources(s => s.Self().CustomSources("data:"))
    .ScriptSources(s => s.Self().CustomSources(
        "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=",
        "sha256-PfI8hHm49boscgavNiOm75C7sPZ+nfvTLsSaEaDMYHM=",
        "sha256-Tui7QoFlnLXkJCSl1/JvEZdIXTmBttnWNxzJpXomQjg="
    ))
);

// app.UseHttpsRedirection();

app.UseSwagger();
app.UseSwaggerUI(c =>
{
    c.RoutePrefix = "docs";
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "API v1");
});

if (!app.Environment.IsDevelopment())
{
    app.Use(async (context, next) =>
    {
        context.Response.Headers.Add("Strict-Transport-Security", "max-age=31536000");
        await next.Invoke();
    });
}

app.UseDefaultFiles();
app.UseStaticFiles();

app.UseCors("CorsPolicy");

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
app.MapHub<ScenarioHub>("/ws");
app.MapHub<ChatHub>("/chat");
app.MapFallbackToController("Index", "Fallback");

AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

using var scope = app.Services.CreateScope();

var services = scope.ServiceProvider;

try
{
    var context = services.GetRequiredService<DataContext>();
    var userManager = services.GetRequiredService<UserManager<AppUser>>();
    var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();

    await context.Database.MigrateAsync();
    await Seed.SeedData(builder.Configuration, context, userManager, roleManager, app.Environment.IsDevelopment());
}
catch (Exception ex)
{
    var logger = services.GetRequiredService<ILogger<Program>>();
    logger.LogError(ex, "An error occured during migration");
}

await app.RunAsync();
