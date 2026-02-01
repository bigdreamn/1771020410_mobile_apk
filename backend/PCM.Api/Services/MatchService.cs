using PCM.Api.Models;

namespace PCM.Api.Services;

public class MatchService
{
    private static List<Match> _matches = new();

    public List<Match> GetAll()
    {
        return _matches;
    }

    public Match Create(Match match)
    {
        match.Id = _matches.Count + 1;
        _matches.Add(match);
        return match;
    }
}
