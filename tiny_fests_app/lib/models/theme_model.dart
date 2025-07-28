class ThemeModel {
  final int id;
  final String name;
  final String category;
  final String description;
  final String? image;
  final bool isActive;

  ThemeModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    this.image,
    required this.isActive,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'description': description,
      'image': image,
      'is_active': isActive,
    };
  }
}