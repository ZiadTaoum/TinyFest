class Testimonial {
  final int? id;
  final String name;
  final String message;
  final int rating;
  final String? avatar;

  Testimonial({
    this.id,
    required this.name,
    required this.message,
    required this.rating,
    this.avatar,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) {
    return Testimonial(
      id: json['id'],
      name: json['name'],
      message: json['message'],
      rating: json['rating'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
      'rating': rating,
      'avatar': avatar,
    };
  }
}