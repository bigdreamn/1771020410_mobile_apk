import 'package:flutter/material.dart';
import '../data/booking_data.dart';
import '../models/booking_model.dart';
import 'booking_history_screen.dart';

class BookingScreen extends StatefulWidget {
  final String courtName;
  final String timeSlot;
  final int price;

  const BookingScreen({
    super.key,
    required this.courtName,
    required this.timeSlot,
    required this.price,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  // ===== CHỌN NGÀY =====
  Future<void> pickDate(bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  // ===== XÁC NHẬN ĐẶT SÂN =====
  void submit() {
    if (_nameCtrl.text.isEmpty ||
        _phoneCtrl.text.isEmpty ||
        startDate == null ||
        endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin')),
      );
      return;
    }

    BookingData.create(
      BookingModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        courtName: widget.courtName,
        timeSlot: widget.timeSlot,
        price: widget.price,
        userName: _nameCtrl.text,
        phone: _phoneCtrl.text,
        startDate: startDate!,
        endDate: endDate!,
        createdAt: DateTime.now(),
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const BookingHistoryScreen()),
    );
  }

  // ===== ĐI XEM LỊCH SỬ (KHÔNG CẦN ĐẶT SÂN) =====
  void goToHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const BookingHistoryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt sân Pickleball'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Xem lịch sử đặt sân',
            onPressed: goToHistory,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // ===== THÔNG TIN SÂN =====
            Text(
              'Sân: ${widget.courtName}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Giờ: ${widget.timeSlot}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Giá: ${widget.price} VND',
              style: const TextStyle(fontSize: 16),
            ),
            const Divider(height: 32),

            // ===== FORM =====
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Tên người đặt',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Số điện thoại',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // ===== NGÀY =====
            ElevatedButton.icon(
              icon: const Icon(Icons.date_range),
              onPressed: () => pickDate(true),
              label: Text(
                startDate == null
                    ? 'Chọn ngày bắt đầu'
                    : 'Bắt đầu: ${startDate!.day}/${startDate!.month}/${startDate!.year}',
              ),
            ),
            const SizedBox(height: 8),

            ElevatedButton.icon(
              icon: const Icon(Icons.event_available),
              onPressed: () => pickDate(false),
              label: Text(
                endDate == null
                    ? 'Chọn ngày trả sân'
                    : 'Kết thúc: ${endDate!.day}/${endDate!.month}/${endDate!.year}',
              ),
            ),

            const SizedBox(height: 24),

            // ===== NÚT ĐẶT SÂN =====
            ElevatedButton(
              onPressed: submit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'XÁC NHẬN ĐẶT SÂN',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 12),

            // ===== NÚT XEM LỊCH SỬ (RÕ RÀNG) =====
            OutlinedButton.icon(
              icon: const Icon(Icons.history),
              label: const Text('Xem lịch sử đặt sân'),
              onPressed: goToHistory,
            ),
          ],
        ),
      ),
    );
  }
}
