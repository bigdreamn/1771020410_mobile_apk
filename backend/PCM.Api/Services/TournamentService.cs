using PCM.Api.Models;

namespace PCM.Api.Services;

public class TournamentService
{
    private static List<Tournament> _tournaments = new()
    {
        new Tournament
        {
            Id = 1,
            Name = "Giải Pickleball Mở Rộng",
            StartDate = DateTime.Today,
            EndDate = DateTime.Today.AddDays(3),
            Description = "Giải đấu dành cho tất cả các thành viên."
        }
    };

    public List<Tournament> GetAll()
    {
        return _tournaments;
    }

    public Tournament? GetById(int id)
    {
        return _tournaments.FirstOrDefault(t => t.Id == id);
    }

    public Tournament Create(Tournament tournament)
    {
        tournament.Id = _tournaments.Count + 1;
        _tournaments.Add(tournament);
        return tournament;
    }
}
