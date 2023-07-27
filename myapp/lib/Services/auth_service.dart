import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl; // Replace with your back-end API URL

  AuthService(this.baseUrl);

  Future<bool> login(String email, String password) async {
    final loginUrl =
        Uri.parse('$baseUrl/login'); // Replace with your login API endpoint

    try {
      final response = await http.post(
        loginUrl,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Successful login, handle the response and return true
        // You can parse the response JSON to get user details if needed
        return true;
      } else {
        // Handle login failure, show error message, and return false
        return false;
      }
    } catch (e) {
      // Handle any network errors or exceptions and return false
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    final registerUrl = Uri.parse(
        '$baseUrl/register'); // Replace with your registration API endpoint

    try {
      final response = await http.post(
        registerUrl,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        // Successful registration, handle the response and return true
        // You can parse the response JSON to get user details if needed
        return true;
      } else {
          
        // Handle registration failure, show error message, and return false
        return false;
      }
    } catch (e) {
      // Handle any network errors or exceptions and return false
      return false;
    }
  }
}
