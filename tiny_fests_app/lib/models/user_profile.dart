class UserProfile {
  final int id;
  final String name;
  final String email;
  final int loyaltyPoints;
  final bool notificationEnabled;
  final List<Favorite> favorites;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.loyaltyPoints,
    required this.notificationEnabled,
    required this.favorites,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      loyaltyPoints: json['loyalty_points'] ?? 0,
      notificationEnabled: json['notification_enabled'] ?? true,
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((fav) => Favorite.fromJson(fav))
          .toList() ?? [],
    );
  }
}

class Favorite {
  final int id;
  final String type;
  final String value;

  Favorite({
    required this.id,
    required this.type,
    required this.value,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
    };
  }
}
