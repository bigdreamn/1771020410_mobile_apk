import 'package:flutter/material.dart';
import '../data/booking_data.dart';
import '../models/booking_model.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({super.key});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  late List<BookingModel> bookings;

  @override
  void initState() {
    super.initState();
    bookings = BookingData.getAll();
  }

  void refresh() {
    setState(() {
      bookings = BookingData.getAll();
    });
  }

  void editBooking(BookingModel booking) {
    final nameCtrl = TextEditingController(text: booking.userName);
    final phoneCtrl = TextEditingController(text: booking.phone);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Sửa đặt sân'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Tên'),
            ),
            TextField(
              controller: phoneCtrl,
              decoration: const InputDecoration(labelText: 'SĐT'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              BookingData.update(
                booking.copyWith(
                  userName: nameCtrl.text,
                  phone: phoneCtrl.text,
                ),
              );
              Navigator.pop(context);
              refresh();
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lịch sử đặt sân')),
      body: bookings.isEmpty
          ? const Center(child: Text('Chưa có lịch sử'))
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (_, i) {
                final b = bookings[i];
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text('${b.courtName} (${b.timeSlot})'),
                    subtitle: Text('Người đặt: ${b.userName}\nSĐT: ${b.phone}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => editBooking(b),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            BookingData.delete(b.id);
                            refresh();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
