namespace PCM.Api.Models;

public class Match
{
    public int Id { get; set; }
    public int TournamentId { get; set; }
    public DateTime MatchTime { get; set; }
}
