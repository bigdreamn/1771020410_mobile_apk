namespace PCM.Api.Models;

public class Wallet
{
    public int Id { get; set; }
    public int MemberId { get; set; }
    public decimal Balance { get; set; }
}
