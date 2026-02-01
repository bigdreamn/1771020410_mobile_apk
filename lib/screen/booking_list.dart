import 'package:flutter/material.dart';
import '../screen/booking_screen.dart';

class BookingListPage extends StatelessWidget {
  const BookingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách sân')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _courtCard(context, 'Sân A', '06:00 - 07:00', 100000),
          _courtCard(context, 'Sân B', '07:00 - 09:00', 200000),
        ],
      ),
    );
  }

  Widget _courtCard(BuildContext context, String name, String time, int price) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text('$time - $price VND'),
        trailing: ElevatedButton(
          child: const Text('Đặt sân'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BookingScreen(
                  courtName: name,
                  timeSlot: time,
                  price: price,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
