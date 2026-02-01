import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final players = [
      {'name': 'Nguyễn Văn A', 'point': 1200},
      {'name': 'Trần Văn B', 'point': 1100},
      {'name': 'Lê Văn C', 'point': 980},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Xếp hạng'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (_, i) {
          return ListTile(
            leading: CircleAvatar(child: Text('#${i + 1}')),
            title: Text(players[i]['name'].toString()),
            trailing: Text('${players[i]['point']} điểm'),
          );
        },
      ),
    );
  }
}
