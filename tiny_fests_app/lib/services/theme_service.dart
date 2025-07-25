import '../core/api.dart';
import '../models/theme_model.dart';

class ThemeService {
  static Future<List<ThemeModel>> fetchThemes() async {
    final data = await Api.get('themes');

    List<ThemeModel> themes = (data as List)
        .map((item) => ThemeModel.fromJson(item))
        .toList();

    return themes;
  }
}
