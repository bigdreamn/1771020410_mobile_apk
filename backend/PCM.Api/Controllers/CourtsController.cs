using Microsoft.AspNetCore.Mvc;
using PCM.Api.Models;

namespace PCM.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CourtsController : ControllerBase
    {
        private static readonly List<Court> Courts = new()
        {
            new Court
            {
                Id = 1,
                Name = "Sân Cầu Lông A",
                Location = "Quận 1",
                PricePerHour = 120000,
                IsAvailable = true
            },
            new Court
            {
                Id = 2,
                Name = "Sân Tennis B",
                Location = "Quận 7",
                PricePerHour = 200000,
                IsAvailable = false
            }
        };

        // GET: api/courts
        [HttpGet]
        public IActionResult GetAllCourts()
        {
            return Ok(Courts);
        }

        // GET: api/courts/1
        [HttpGet("{id}")]
        public IActionResult GetCourtById(int id)
        {
            var court = Courts.FirstOrDefault(c => c.Id == id);
            if (court == null)
                return NotFound("Không tìm thấy sân");

            return Ok(court);
        }
    }
}
