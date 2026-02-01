import '../models/booking_model.dart';

class FakeBookingDB {
  static final List<BookingModel> _bookings = [];

  static List<BookingModel> getAll() {
    return _bookings;
  }

  static void add(BookingModel booking) {
    _bookings.add(booking);
  }

  static void delete(String id) {
    _bookings.removeWhere((b) => b.id == id);
  }

  static void update(BookingModel booking) {
    final index = _bookings.indexWhere((b) => b.id == booking.id);
    if (index != -1) {
      _bookings[index] = booking;
    }
  }
}
