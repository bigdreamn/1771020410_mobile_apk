import 'dart:convert';
import 'package:http/http.dart' as http;

class WalletService {
  static const String baseUrl = 'http://103.77.172.200:5003/api/wallet';
  // nếu chạy web: http://localhost:5003/API/wallet

  Future<double> getBalance(String username) async {
    // Backend expects GET /api/wallet/me
    final response = await http.get(Uri.parse('$baseUrl/me'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Backend Member model has WalletBalance property (PascalCase -> camelCase default likely, but let's check runtime or assume default)
      // Actually strictly C# default serializer produces camelCase.
      return (data['walletBalance'] as num).toDouble();
    }
    return 0.0;
  }

  Future<void> deposit(String username, double amount) async {
    // Backend expects POST /api/wallet/deposit with [FromBody] decimal
    await http.post(
      Uri.parse('$baseUrl/deposit'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(amount),
    );
  }

  Future<void> withdraw(String username, double amount) async {
    await http.post(
      Uri.parse('$baseUrl/withdraw'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'amount': amount}),
    );
  }
}
