import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
static const String baseUrl = 'http://10.0.2.2:8000/api';


  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> setAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<Map<String, String>> getHeaders({bool requiresAuth = false}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (requiresAuth) {
      final token = await getAuthToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  static Future<dynamic> get(String path, {bool auth = false}) async {
    final uri = Uri.parse('$baseUrl/$path');
    final response = await http.get(uri, headers: await getHeaders(requiresAuth: auth));
    return _handleResponse(response);
  }

  static Future<dynamic> post(String path, Map<String, dynamic> data, {bool auth = false}) async {
    final uri = Uri.parse('$baseUrl/$path');
    final response = await http.post(
      uri,
      headers: await getHeaders(requiresAuth: auth),
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  static dynamic _handleResponse(http.Response response) {
    debugPrint('API ${response.request?.url} [${response.statusCode}]: ${response.body}');
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('API Error: ${response.statusCode} → ${response.body}');
    }
  }
}
