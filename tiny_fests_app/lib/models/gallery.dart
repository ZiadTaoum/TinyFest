class GalleryItem {
  final int? id;
  final String title;
  final String type;
  final String file;
  final String category;
  final bool isFeatured;

  GalleryItem({
    this.id,
    required this.title,
    required this.type,
    required this.file,
    required this.category,
    required this.isFeatured,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      file: json['file'],
      category: json['category'],
      isFeatured: json['is_featured'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
      'file': file,
      'category': category,
      'is_featured': isFeatured,
    };
  }
}