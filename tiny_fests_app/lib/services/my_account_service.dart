// import '../core/api.dart';
// import '../models/theme_model.dart'; // Ensure this file exists and exports ThemeModel
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_profile.dart';
import 'api_service.dart';

class MyAccountService {
  static Future<UserProfile> getProfile() async {
    try {
      final headers = await ApiService.getHeaders(requiresAuth: true);
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/my-account'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return UserProfile.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      throw Exception('Error fetching profile: $e');
    }
  }

  static Future<Favorite> addFavorite(String type, String value) async {
    try {
      final headers = await ApiService.getHeaders(requiresAuth: true);
      final response = await http.post(
        Uri.parse('${ApiService.baseUrl}/favorites'),
        headers: headers,
        body: json.encode({'type': type, 'value': value}),
      );

      if (response.statusCode == 201) {
        return Favorite.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to add favorite');
      }
    } catch (e) {
      throw Exception('Error adding favorite: $e');
    }
  }

  static Future<void> removeFavorite(int id) async {
    try {
      final headers = await ApiService.getHeaders(requiresAuth: true);
      final response = await http.delete(
        Uri.parse('${ApiService.baseUrl}/favorites/$id'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to remove favorite');
      }
    } catch (e) {
      throw Exception('Error removing favorite: $e');
    }
  }
}