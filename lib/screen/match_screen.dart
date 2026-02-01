import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kèo thi đấu')),
      body: const Center(
        child: Text('Danh sách kèo Pickleball', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
