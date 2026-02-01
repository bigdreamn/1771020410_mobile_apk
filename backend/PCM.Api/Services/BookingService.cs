using PCM.Api.Models;

namespace PCM.Api.Services;

public class BookingService
{
    private static List<Booking> _bookings = new();

    public List<Booking> GetAll()
    {
        return _bookings;
    }

    public Booking Create(Booking booking)
    {
        booking.Id = _bookings.Count + 1;
        _bookings.Add(booking);
        return booking;
    }
}
