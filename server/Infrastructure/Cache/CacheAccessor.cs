using Application.Interfaces;
using Domain;
using Microsoft.Extensions.Caching.Distributed;

namespace Infrastructure.Cache;

public class CacheAccessor : ICacheAccessor
{
    private const string InvitePrefix = "invite-id";
    private readonly IDistributedCache _cache;

    public CacheAccessor(IDistributedCache cache)
    {
        _cache = cache;
    }

    public async Task<string?> GenerateInvite(string id, ExpirationDate date)
    {
        var token = Guid.NewGuid().ToString()[..5];

        // Store the ID for a day
        var options = new DistributedCacheEntryOptions()
            .SetAbsoluteExpiration(GetTimeSpan(date));

        await _cache.SetStringAsync($"{InvitePrefix}:{token}", id, options);

        return token;
    }

    private static TimeSpan GetTimeSpan(ExpirationDate date)
    {
        return date switch
        {
            ExpirationDate.ThirtyMinutes => TimeSpan.FromMinutes(30),
            ExpirationDate.OneHour => TimeSpan.FromHours(1),
            ExpirationDate.SixHours => TimeSpan.FromHours(6),
            ExpirationDate.TwelveHours => TimeSpan.FromHours(12),
            ExpirationDate.OneDay => TimeSpan.FromDays(1),
            ExpirationDate.SevenDays => TimeSpan.FromDays(7),
            _ => TimeSpan.FromDays(1)
        };
    }

    public async Task<string?> GetProjectFromInvite(string invite)
    {
        var key = $"{InvitePrefix}:{invite}";
        return await _cache.GetStringAsync(key);
    }
}
