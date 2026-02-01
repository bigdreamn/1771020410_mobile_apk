import 'package:flutter/material.dart';
import 'booking_list.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đặt sân'), centerTitle: true),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => BookingListPage()),
            );
          },
          child: const Text('Đặt sân ngay'),
        ),
      ),
    );
  }
}
