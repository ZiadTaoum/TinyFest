import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import '../models/gallery.dart';

class GalleryService {
  static Future<List<GalleryItem>> getPortfolio() async {
    try {
      final headers = await ApiService.getHeaders();
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/portfolio'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => GalleryItem.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load portfolio');
      }
    } catch (e) {
      throw Exception('Error fetching portfolio: $e');
    }
  }

  // Admin functions
  static Future<GalleryItem> createPortfolioItem(GalleryItem item) async {
    try {
      final headers = await ApiService.getHeaders(requiresAuth: true);
      final response = await http.post(
        Uri.parse('${ApiService.baseUrl}/portfolio'),
        headers: headers,
        body: json.encode(item.toJson()),
      );

      if (response.statusCode == 201) {
        return GalleryItem.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create portfolio item');
      }
    } catch (e) {
      throw Exception('Error creating portfolio item: $e');
    }
  }

  static Future<void> deletePortfolioItem(int id) async {
    try {
      final headers = await ApiService.getHeaders(requiresAuth: true);
      final response = await http.delete(
        Uri.parse('${ApiService.baseUrl}/portfolio/$id'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete portfolio item');
      }
    } catch (e) {
      throw Exception('Error deleting portfolio item: $e');
    }
  }
}
