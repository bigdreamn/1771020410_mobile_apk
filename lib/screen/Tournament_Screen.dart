import 'package:flutter/material.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({super.key});

  // 👉 DATA GIẢ (SAU NÀY THAY BẰNG API)
  List<Map<String, dynamic>> get rankingData => [
    {
      'rank': 1,
      'name': 'Nguyễn Văn A',
      'point': 1200,
      'match': 20,
      'win': 15,
      'lose': 5,
    },
    {
      'rank': 2,
      'name': 'Trần Văn B',
      'point': 1100,
      'match': 18,
      'win': 13,
      'lose': 5,
    },
    {
      'rank': 3,
      'name': 'Lê Văn C',
      'point': 980,
      'match': 16,
      'win': 10,
      'lose': 6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bảng xếp hạng'), centerTitle: true),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: rankingData.length,
        itemBuilder: (context, index) {
          final item = rankingData[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(
                  item['rank'].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              title: Text(
                item['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text(
                'Trận: ${item['match']} | Thắng: ${item['win']} | Thua: ${item['lose']}',
              ),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Điểm', style: TextStyle(fontSize: 12)),
                  Text(
                    item['point'].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
