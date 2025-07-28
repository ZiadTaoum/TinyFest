import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import '../models/addon_model.dart';

class AddonService {
  static Future<List<AddonModel>> getAddons() async {
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
        throw Exception('Failed to load addons');
      }
    } catch (e) {
      throw Exception('Error fetching addons: $e');
    }
  }
}
