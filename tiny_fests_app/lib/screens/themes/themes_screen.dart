import 'package:flutter/material.dart';
import '../../models/theme_model.dart';
import '../../services/theme_service.dart';

class ThemesScreen extends StatefulWidget {
  @override
  _ThemesScreenState createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  List<ThemeModel> themes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchThemes();
  }

  Future<void> fetchThemes() async {
    try {
      final fetchedThemes = await ThemeService.fetchThemes();
      setState(() {
        themes = fetchedThemes;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching themes: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Themes')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : themes.isEmpty
              ? Center(child: Text('No themes found.'))
              : ListView.builder(
                  itemCount: themes.length,
                  itemBuilder: (context, index) {
                    final theme = themes[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Text(theme.name ?? 'No Name'),
                        subtitle: Text(theme.description ?? ''),
                        trailing: theme.image != null
                            ? Image.network(
                                theme.image!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    );
                  },
                ),
    );
  }
}
