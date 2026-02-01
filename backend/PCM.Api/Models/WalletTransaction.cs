namespace PCM.Api.Models;

public class WalletTransaction
{
    public int Id { get; set; }
    public int MemberId { get; set; }
    public decimal Amount { get; set; }
    public string Type { get; set; } = ""; // Deposit, Payment
    public DateTime CreatedAt { get; set; } = DateTime.Now;
}
