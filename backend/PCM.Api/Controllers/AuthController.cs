using Microsoft.AspNetCore.Mvc;
using PCM.Api.Models;
using PCM.Api.DTOs;

namespace PCM.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        // Mock database
        private static readonly List<Member> Members = new();

        // POST: api/auth/register
        [HttpPost("register")]
        public IActionResult Register(RegisterDto dto)
        {
            if (Members.Any(m => m.Email == dto.Email))
                return BadRequest("Email đã tồn tại");

            var member = new Member
            {
                Id = Members.Count + 1,
                FullName = dto.FullName,
                Email = dto.Email,
                Password = dto.Password,
                WalletBalance = 0
            };

            Members.Add(member);

            return Ok(new
            {
                message = "Đăng ký thành công",
                member.Id,
                member.FullName,
                member.Email
            });
        }

        // POST: api/auth/login
        [HttpPost("login")]
        public IActionResult Login(LoginDto dto)
        {
            var member = Members.FirstOrDefault(m =>
                m.Email == dto.Email && m.Password == dto.Password);

            if (member == null)
                return Unauthorized("Sai email hoặc mật khẩu");

            return Ok(new
            {
                message = "Đăng nhập thành công",
                member.Id,
                member.FullName,
                member.Email,
                member.WalletBalance
            });
        }
    }
}
