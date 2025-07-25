import 'package:flutter/material.dart';
import 'screens/bookings/booking_form_screen.dart';
import 'screens/themes/themes_screen.dart';

void main() {
  runApp(TinyFestsApp());
}

class TinyFestsApp extends StatelessWidget {
  const TinyFestsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiny Fests',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(), // temporary home
        '/book': (context) =>  BookingFormScreen(),
        '/themes': (context) =>  ThemesScreen(),
      },
    );
  }
}

// Just a sample home screen for navigation
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tiny Fests Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Book a Party'),
              onPressed: () => Navigator.pushNamed(context, '/book'),
            ),
            ElevatedButton(
              child: Text('View Themes'),
              onPressed: () => Navigator.pushNamed(context, '/themes'),
            ),
          ],
        ),
      ),
    );
  }
}
