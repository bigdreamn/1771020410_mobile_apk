using Microsoft.AspNetCore.Mvc;
using PCM.Api.Services;

namespace PCM.Api.Controllers;

[ApiController]
[Route("api/wallet")]
public class WalletController : ControllerBase
{
    private readonly WalletService _walletService;

    public WalletController(WalletService walletService)
    {
        _walletService = walletService;
    }

    [HttpGet("me")]
    public IActionResult Me()
    {
        return Ok(_walletService.GetMe());
    }

    [HttpPost("deposit")]
    public IActionResult Deposit([FromBody] decimal amount)
    {
        _walletService.Deposit(amount);
        return Ok(new { message = "Nạp tiền thành công" });
    }

    [HttpGet("transactions")]
    public IActionResult Transactions()
    {
        return Ok(_walletService.GetTransactions());
    }
}
