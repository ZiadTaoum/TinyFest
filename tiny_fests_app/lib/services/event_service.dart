import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'api_service.dart';
// import '../models/booking.dart';
import '../models/event.dart';

class EventService {
  static Future<List<Event>> getEvents() async {
    try {
      final headers = await ApiService.getHeaders();
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/events'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Event.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load events');
      }
    } catch (e) {
      throw Exception('Error fetching events: $e');
    }
  }

  static Future<Event> getEvent(int id) async {
    try {
      final headers = await ApiService.getHeaders();
      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/events/$id'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return Event.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load event');
      }
    } catch (e) {
      throw Exception('Error fetching event: $e');
    }
  }
}