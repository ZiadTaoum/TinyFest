class Event {
  final int? id;
  final String title;
  final String location;
  final DateTime startTime;
  final String description;
  final String? image;
  final int maxSpots;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Event({
    this.id,
    required this.title,
    required this.location,
    required this.startTime,
    required this.description,
    this.image,
    required this.maxSpots,
    this.createdAt,
    this.updatedAt,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      location: json['location'],
      startTime: DateTime.parse(json['start_time']),
      description: json['description'],
      image: json['image'],
      maxSpots: json['max_spots'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}