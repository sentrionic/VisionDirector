using System.Security.Claims;
using API.DTOs;
using API.Services;
using Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AccountController : ControllerBase
{
    private readonly DataContext _context;
    private readonly SignInManager<AppUser> _signInManager;
    private readonly TokenService _tokenService;
    private readonly UserManager<AppUser> _userManager;

    public AccountController(UserManager<AppUser> userManager,
        SignInManager<AppUser> signInManager, TokenService tokenService, DataContext context)
    {
        _tokenService = tokenService;
        _context = context;
        _signInManager = signInManager;
        _userManager = userManager;
    }

    /// <summary>
    ///     Signs in the user.
    /// </summary>
    /// <remarks>
    ///     Sample request:
    /// 
    ///     POST /api/account/login
    ///         {
    ///             "email": "test@example.com",
    ///             "password: "password"
    ///         }
    /// </remarks>
    /// <returns>The JWT and user object</returns>
    /// <response code="200">The JWT and user object</response>
    /// <response code="400">Validation fails</response>
    [AllowAnonymous]
    [HttpPost("login")]
    [ProducesResponseType(typeof(AuthDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<AuthDto>> Login(LoginDto loginDto)
    {
        var user = await _userManager.FindByEmailAsync(loginDto.Email);

        if (user == null)
        {
            return Unauthorized();
        }

        var result = await _signInManager.CheckPasswordSignInAsync(user, loginDto.Password, false);

        if (result.Succeeded)
        {
            return CreateAuthObject(user);
        }

        return Unauthorized();
    }

    /// <summary>
    ///     Registers the user.
    /// </summary>
    /// <remarks>
    ///     Sample request:
    /// 
    ///     POST /api/account/register
    ///         {
    ///             "username: "username",
    ///             "email": "test@example.com",
    ///             "password: "password"
    ///         }
    /// </remarks>
    /// <returns>The JWT and user object</returns>
    /// <response code="201">The JWT and user object</response>
    /// <response code="400">Validation fails</response>
    [AllowAnonymous]
    [HttpPost("register")]
    [ProducesResponseType(typeof(AuthDto), StatusCodes.Status201Created)]
    public async Task<ActionResult<AuthDto>> Register(RegisterDto registerDto)
    {
        if (await _userManager.Users.AnyAsync(x => x.Email == registerDto.Email))
        {
            ModelState.AddModelError("email", "Email taken");
            return ValidationProblem();
        }

        if (await _userManager.Users.AnyAsync(x => x.UserName == registerDto.UserName))
        {
            ModelState.AddModelError("username", "Username taken");
            return ValidationProblem();
        }

        var user = new AppUser { UserName = registerDto.UserName, Email = registerDto.Email };

        var result = await _userManager.CreateAsync(user, registerDto.Password);

        if (!result.Succeeded)
        {
            return BadRequest("Problem registering user");
        }

        await _userManager.AddToRoleAsync(user, registerDto.Role.ToString());
        return CreateAuthObject(user);
    }

    /// <summary>
    ///     Creates an account.
    /// </summary>
    /// <remarks>
    ///     **Admin only**
    /// 
    ///     Sample request:
    /// 
    ///     POST /api/account/create
    ///         {
    ///             "username: "username",
    ///             "email": "test@example.com",
    ///             "password: "password",
    ///             "role": "Engineer"
    ///         }
    /// </remarks>
    /// <returns>The newly created user</returns>
    /// <response code="201">The JWT and user object</response>
    /// <response code="400">Validation fails</response>
    [HttpPost("create")]
    [Authorize(Policy = Constants.IsAdmin)]
    [ProducesResponseType(typeof(AuthDto), StatusCodes.Status201Created)]
    public async Task<ActionResult<AuthDto>> CreateAccount(RegisterDto registerDto)
    {
        if (await _userManager.Users.AnyAsync(x => x.Email == registerDto.Email))
        {
            ModelState.AddModelError("email", "Email taken");
            return ValidationProblem();
        }

        if (await _userManager.Users.AnyAsync(x => x.UserName == registerDto.UserName))
        {
            ModelState.AddModelError("username", "Username taken");
            return ValidationProblem();
        }

        var user = new AppUser { UserName = registerDto.UserName, Email = registerDto.Email };

        var result = await _userManager.CreateAsync(user, registerDto.Password);

        if (!result.Succeeded)
        {
            return BadRequest("Problem registering user");
        }

        await _userManager.AddToRoleAsync(user, registerDto.Role.ToString());
        return CreateAuthObject(user);
    }

    /// <summary>
    ///     Fetches the current user's info
    /// </summary>
    /// <returns>The JWT and user object</returns>
    /// <response code="200">The JWT and user object</response>
    [HttpGet]
    [Authorize]
    [ProducesResponseType(typeof(AuthDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<AuthDto>> GetCurrentUser()
    {
        var user = await _userManager.FindByIdAsync(User.FindFirstValue(ClaimTypes.NameIdentifier));

        return CreateAuthObject(user);
    }

    /// <summary>
    ///     Fetches a list of all registered users
    /// </summary>
    /// <remarks>
    ///     **Admin only**
    /// </remarks>
    /// <returns>A list of users</returns>
    /// <response code="200">Returns a list of users</response>
    [HttpGet("list")]
    [Authorize(Policy = Constants.IsAdmin)]
    [ProducesResponseType(typeof(List<AuthDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<UserDto>>> GetAllUsers()
    {
        var users = await _context.Users.ToListAsync();
        return users.Select(x => new UserDto
        {
            Id = x.Id,
            Email = x.Email,
            Username = x.UserName,
            Role = _userManager.GetRolesAsync(x).Result.ToList().First()
        }).ToList();
    }
    
    /// <summary>
    ///     Updates the user's account details
    ///
    ///     Sample request:
    /// 
    ///     PUT /api/account
    ///         {
    ///             "username: "newUsername",
    ///             "email": "new@example.com"
    ///         }
    /// </summary>
    /// <returns>The JWT and user object</returns>
    /// <response code="200">The JWT and user object</response>
    [HttpPut]
    [Authorize]
    [ProducesResponseType(typeof(AuthDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<AuthDto>> UpdateAccount(UpdateDto updateDto)
    {
        var user = await _userManager.FindByIdAsync(User.FindFirstValue(ClaimTypes.NameIdentifier));

        if (user == null)
        {
            return Unauthorized();
        }

        var email = updateDto.Email?.Trim();
        var username = updateDto.UserName?.Trim();
        
        if (user.Email != email && await _userManager.Users.AnyAsync(x => x.Email == email))
        {
            ModelState.AddModelError("email", "Email taken");
            return ValidationProblem();
        }

        if (user.UserName != username && await _userManager.Users.AnyAsync(x => x.UserName == username))
        {
            ModelState.AddModelError("username", "Username taken");
            return ValidationProblem();
        }
        
        user.Email = email ?? user.Email;
        user.UserName = username ?? user.UserName;

        var result = await _userManager.UpdateAsync(user);

        if (!result.Succeeded)
        {
            return BadRequest("Problem updating the user");
        }

        return CreateAuthObject(user);
    }

    /// <summary>
    ///     Changes the current user's password
    /// </summary>
    /// <returns>The JWT and user object</returns>
    /// <response code="200">The JWT and user object</response>
    [HttpPut("change-password")]
    [Authorize]
    [ProducesResponseType(typeof(AuthDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<AuthDto>> ChangePassword(ChangePasswordDto changePasswordDto)
    {
        var user = await _userManager.FindByIdAsync(User.FindFirstValue(ClaimTypes.NameIdentifier));

        if (user == null)
        {
            return Unauthorized();
        }

        var result = await _userManager.ChangePasswordAsync(user, changePasswordDto.CurrentPassword,
            changePasswordDto.NewPassword);

        return result.Succeeded ? CreateAuthObject(user) : Unauthorized();
    }

    private AuthDto CreateAuthObject(AppUser user)
    {
        return new AuthDto
        {
            Token = _tokenService.CreateToken(user),
            User = new UserDto
            {
                Id = user.Id,
                Role = _userManager.GetRolesAsync(user).Result.ToList().First(),
                Email = user.Email,
                Username = user.UserName
            }
        };
    }
}
