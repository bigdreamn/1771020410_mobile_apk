using Microsoft.AspNetCore.Mvc;
using PCM.Api.Models;
using PCM.Api.Services;

namespace PCM.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class BookingController : ControllerBase
{
    private readonly BookingService _service;

    public BookingController(BookingService service)
    {
        _service = service;
    }

    [HttpGet]
    public IActionResult GetAll()
        => Ok(_service.GetAll());

    [HttpPost]
    public IActionResult Create(Booking booking)
        => Ok(_service.Create(booking));
}
