import 'package:flutter/material.dart';
import '../../models/theme_model.dart';
import '../../services/theme_service.dart';

class BookingFormScreen extends StatefulWidget {
  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  List<ThemeModel> themes = [];
  ThemeModel? selectedTheme;

  @override
  void initState() {
    super.initState();
    loadThemes();
  }

  Future<void> loadThemes() async {
    try {
      final result = await ThemeService.fetchThemes();
      setState(() {
        themes = result;
        if (themes.isNotEmpty) {
          selectedTheme = themes.first;
        }
      });
    } catch (e) {
      print('Failed to load themes: $e');
    }
  }

  @override
Widget build(BuildContext context) {
  try {
    return Scaffold(
      appBar: AppBar(title: Text("Book a Party")),
      body: Center(child: Text("Hello")),
    );
  } catch (e) {
    return Scaffold(
      body: Center(child: Text('Error: $e')),
    );
  }
}

}
