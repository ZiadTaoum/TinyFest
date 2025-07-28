import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import '../models/package_model.dart';

class PackageService {
  static Future<List<PackageModel>> getPackages() async {
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
        throw Exception('Failed to load packages');
      }
    } catch (e) {
      throw Exception('Error fetching packages: $e');
    }
  }
}
