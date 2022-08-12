using System.ComponentModel;
using System.Reflection;
using System.Text.Json.Serialization;
using Application.Core;
using Application.Interfaces;
using Application.Projects;
using Infrastructure.Cache;
using Infrastructure.Media;
using Infrastructure.Security;
using MediatR;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using Persistence;
using StackExchange.Redis;

namespace API.Extensions;

public static class ApplicationServiceExtensions
{
    public static void AddApplicationServices(this IServiceCollection services,
        IConfiguration config)
    {
        services.Configure<ForwardedHeadersOptions>(options =>
        {
            options.ForwardedHeaders =
                ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto;
        });

        services.AddSwaggerGen(c =>
        {
            c.SwaggerDoc("v1",
                new OpenApiInfo
                {
                    Title = "Vision Director API",
                    Version = "v1",
                    Description = "A .NET 6 Web API for managing collaborative video work"
                });

            c.CustomSchemaIds(x =>
                x.GetCustomAttributes(false).OfType<DisplayNameAttribute>().FirstOrDefault()?.DisplayName ??
                x.FullName);

            c.OperationFilter<SecurityRequirementsOperationFilter>();

            var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
            c.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));
        });

        services.AddDbContext<DataContext>(options =>
        {
            var connection = config.GetConnectionString("DefaultConnection");
            options.UseNpgsql(connection);
        });

        services.AddStackExchangeRedisCache(options =>
        {
            options.Configuration = config.GetConnectionString("RedisConnection");
        });

        services.AddCors(opt =>
        {
            opt.AddPolicy("CorsPolicy", policy =>
            {
                policy
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowCredentials()
                    .WithOrigins("http://localhost:3000");
            });
        });

        services.AddRouting(options => options.LowercaseUrls = true);

        // Add injectable services
        services.AddMediatR(typeof(ProjectList.Handler).Assembly);
        services.AddAutoMapper(typeof(MappingProfiles).Assembly);
        services.AddScoped<IUserAccessor, UserAccessor>();
        services.AddScoped<IMediaAccessor, MediaAccessor>();
        services.AddScoped<ICacheAccessor, CacheAccessor>();
        services.AddSignalR().AddJsonProtocol(opt =>
        {
            opt.PayloadSerializerOptions.Converters.Add(new JsonStringEnumConverter());
        });
    }
}
