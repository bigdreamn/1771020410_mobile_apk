namespace PCM.Api.Models;

public class Booking
{
    public int Id { get; set; }
    public int MemberId { get; set; }
    public DateTime BookingDate { get; set; }
    public string Status { get; set; } = "Pending";
}
