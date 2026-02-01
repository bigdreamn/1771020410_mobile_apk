import '../fake_db/fake_booking_db.dart';
import '../models/booking_model.dart';

class BookingData {
  static List<BookingModel> getAll() {
    return FakeBookingDB.getAll();
  }

  static void create(BookingModel booking) {
    FakeBookingDB.add(booking);
  }

  static void delete(String id) {
    FakeBookingDB.delete(id);
  }

  static void update(BookingModel booking) {
    FakeBookingDB.update(booking);
  }
}
