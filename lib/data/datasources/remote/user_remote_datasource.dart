import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  UserRemoteDataSource({required this.client, required this.baseUrl});

  Future<String> login({
    required String email,
    required String password,
  }) async {
    final response = await client.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return jsonBody['token'];
    } else {
      throw Exception('Login failed (${response.statusCode})');
    }
  }
}
