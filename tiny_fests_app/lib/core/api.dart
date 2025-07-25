import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:8000/api'; // Web fallback
    } else {
      return dotenv.env['API_BASE_URL']!;
    }
  }

  static Future<dynamic> get(String path) async {
    final response = await http.get(Uri.parse('$baseUrl/$path'));
    return _handleResponse(response);
  }

  static Future<dynamic> post(String path, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$path'),
      body: data,
    );
    return _handleResponse(response);
  }

  static dynamic _handleResponse(http.Response res) {
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return json.decode(res.body);
    } else {
      throw Exception('API Error: ${res.statusCode} → ${res.body}');
    }
  }
}
