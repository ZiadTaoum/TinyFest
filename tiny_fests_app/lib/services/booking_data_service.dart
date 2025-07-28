import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/theme_model.dart';
import '../models/package_model.dart';
import '../models/addon_model.dart';
import 'api_service.dart';

class BookingDataService {
  static Future<List<ThemeModel>> fetchThemes() async {
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
        throw Exception('Failed to fetch themes');
      }
    } catch (e) {
      throw Exception('Error fetching themes: $e');
    }
  }

  static Future<List<PackageModel>> fetchPackages() async {
    try {
      final headers = await ApiService.getHeaders();
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/packages'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => PackageModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch packages');
      }
    } catch (e) {
      throw Exception('Error fetching packages: $e');
    }
  }

  static Future<List<AddonModel>> fetchAddons() async {
    try {
      final headers = await ApiService.getHeaders();
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/addons'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => AddonModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch addons');
      }
    } catch (e) {
      throw Exception('Error fetching addons: $e');
    }
  }
}
