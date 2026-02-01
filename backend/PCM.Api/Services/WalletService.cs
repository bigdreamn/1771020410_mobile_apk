using PCM.Api.Models;

namespace PCM.Api.Services;

public class WalletService
{
    private static List<Member> _members = new()
    {
        new Member { Id = 1, FullName = "Nguyen Van A", WalletBalance = 2_000_000 }
    };

    private static List<WalletTransaction> _transactions = new();

    public Member GetMe()
        => _members.First();

    public void Deposit(decimal amount)
    {
        var member = _members.First();
        member.WalletBalance += amount;

        _transactions.Add(new WalletTransaction
        {
            Id = _transactions.Count + 1,
            MemberId = member.Id,
            Amount = amount,
            Type = "Deposit"
        });
    }

    public List<WalletTransaction> GetTransactions()
        => _transactions;
}
