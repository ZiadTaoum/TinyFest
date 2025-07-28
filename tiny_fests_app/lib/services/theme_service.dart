import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import '../models/theme_model.dart';

class ThemeService {
  static Future<List<ThemeModel>> getThemes() async {
    try {
      final headers = await ApiService.getHeaders();
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/themes'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => ThemeModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load themes');
      }
    } catch (e) {
      throw Exception('Error fetching themes: $e');
    }
  }
}
