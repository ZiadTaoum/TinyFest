import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/booking.dart';

class BookingService {
  static const String baseUrl = 'YOUR_API_BASE_URL'; // Replace with your actual API URL
  
  static Future<Booking> createBooking(Booking booking) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/bookings'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Add authorization header if needed
          // 'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'child_name': booking.childName,
          'birthday_date': booking.birthdayDate,
          'location': booking.location,
          'theme_id': booking.themeId,
          'package_id': booking.packageId,
          'addons': booking.addonIds,
          'total_price': booking.totalPrice,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['success'] == true) {
          return Booking.fromJson(jsonResponse['booking']);
        } else {
          throw Exception('Booking creation failed: ${jsonResponse['message'] ?? 'Unknown error'}');
        }
      } else {
        final errorResponse = jsonDecode(response.body);
        throw Exception('HTTP ${response.statusCode}: ${errorResponse['message'] ?? 'Unknown error'}');
      }
    } catch (e) {
      print('Error creating booking: $e');
      rethrow;
    }
  }

  static Future<List<Booking>> fetchBookings() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/bookings'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Add authorization header if needed
          // 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((booking) => Booking.fromJson(booking)).toList();
      } else {
        throw Exception('Failed to fetch bookings');
      }
    } catch (e) {
      print('Error fetching bookings: $e');
      rethrow;
    }
  }

  static Future<Booking> fetchBooking(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/bookings/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Add authorization header if needed
          // 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return Booking.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to fetch booking');
      }
    } catch (e) {
      print('Error fetching booking: $e');
      rethrow;
    }
  }
}