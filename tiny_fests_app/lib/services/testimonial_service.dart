import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import '../models/testimonial.dart';

class TestimonialService {
  static Future<List<Testimonial>> getTestimonials() async {
    try {
      final headers = await ApiService.getHeaders();
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/testimonials'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Testimonial.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load testimonials');
      }
    } catch (e) {
      throw Exception('Error fetching testimonials: $e');
    }
  }

  static Future<Testimonial> createTestimonial(Testimonial testimonial) async {
    try {
      final headers = await ApiService.getHeaders();
      final response = await http.post(
        Uri.parse('${ApiService.baseUrl}/testimonials'),
        headers: headers,
        body: json.encode(testimonial.toJson()),
      );

      if (response.statusCode == 201) {
        return Testimonial.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create testimonial');
      }
    } catch (e) {
      throw Exception('Error creating testimonial: $e');
    }
  }
}
