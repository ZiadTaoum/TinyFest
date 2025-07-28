import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<dynamic> events = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final response = await ApiService.get('events');
      debugPrint('✅ API Response: $response');
      setState(() {
        events = response;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('❌ Error: $e');
      setState(() {
        isLoading = false;
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🎪 Special Events'),
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text('Error: $error'))
              : events.isEmpty
                  ? Center(child: Text('No events found.'))
                  : ListView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return buildEventCard(event);
                      },
                    ),
    );
  }

  Widget buildEventCard(dynamic event) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Icon(Icons.celebration, size: 40, color: Colors.white),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    event['title'] ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rowItem(Icons.calendar_today, formatDateTime(event['start_time'])),
                SizedBox(height: 8),
                rowItem(Icons.location_on, event['location'] ?? ''),
                SizedBox(height: 8),
                rowItem(Icons.people, '${event['max_spots']} spots'),
                SizedBox(height: 8),
                rowItem(Icons.info_outline, event['description'] ?? ''),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.calendar_today),
                        label: Text('Add to Calendar'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.confirmation_number),
                        label: Text('Book Now'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[700], size: 18),
        SizedBox(width: 8),
        Expanded(child: Text(text, style: TextStyle(color: Colors.grey[800]))),
      ],
    );
  }

  String formatDateTime(String dateTime) {
    final dt = DateTime.parse(dateTime);
    return '${dt.day}-${dt.month}-${dt.year} at ${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';
  }
}
