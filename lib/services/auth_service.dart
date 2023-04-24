// Create a AuthService class that will handle the API requests for login and logout
import 'dart:convert';
import 'package:erp_v1/modals/users.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const endpoint = 'http://192.168.1.8:8000/user_login';

  Future<User> login(String username, String password) async {
    print("api call started");
    final response = await http.post(
      Uri.parse('$endpoint/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final userJson = jsonDecode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> logout(String token) async {
    final response = await http.post(
      Uri.parse('$endpoint/logout'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout');
    }
  }
}
