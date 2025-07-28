import 'dart:convert';
import 'package:http/http.dart' as http;
// import '../models/user_profile.dart';
import 'api_service.dart';
import '../models/contact.dart';

class ContactService {
  static Future<ContactInfo> getContactInfo() async {
    try {
      final headers = await ApiService.getHeaders();
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/contact-info'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return ContactInfo.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load contact info');
      }
    } catch (e) {
      throw Exception('Error fetching contact info: $e');
    }
  }

  static Future<List<Faq>> getFaqs() async {
    try {
      final headers = await ApiService.getHeaders();
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/faqs'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Faq.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load FAQs');
      }
    } catch (e) {
      throw Exception('Error fetching FAQs: $e');
    }
  }
}