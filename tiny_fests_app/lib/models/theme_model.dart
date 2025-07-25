class ThemeModel {
  final int id;
  final String name;
  final String? category;
  final String? description;
  final String? image;

  ThemeModel({
    required this.id,
    required this.name,
    this.category,
    this.description,
    this.image,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }
}
