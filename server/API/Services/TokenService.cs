using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Domain;
using Microsoft.IdentityModel.Tokens;

namespace API.Services;

public class TokenService
{
    private readonly IConfiguration _config;

    public TokenService(IConfiguration config)
    {
        _config = config;
    }

    /// <summary>
    ///     Creates a JWT for the given user
    /// </summary>
    /// <param name="user">The user that needs the token</param>
    /// <returns>A valid JWT</returns>
    public string CreateToken(AppUser user)
    {
        // Add userId to the JWT
        var claims = new List<Claim> { new(ClaimTypes.NameIdentifier, user.Id) };

        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["TokenKey"]));
        var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

        // Valid for 7 days
        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(claims),
            Expires = DateTime.Now.AddDays(7),
            SigningCredentials = credentials
        };

        var tokenHandler = new JwtSecurityTokenHandler();

        var token = tokenHandler.CreateToken(tokenDescriptor);

        return tokenHandler.WriteToken(token);
    }
}
