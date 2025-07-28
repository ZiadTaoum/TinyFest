class Booking {
  final int? id;
  final String childName;
  final String birthdayDate;
  final String location;
  final int themeId;               // changed from `String theme`
  final int packageId;             // new: reference to packages table
  final List<int> addonIds;        // changed from `List<String> addons`
  final String paymentStatus;
  final double totalPrice;
  final int userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Booking({
    this.id,
    required this.childName,
    required this.birthdayDate,
    required this.location,
    required this.themeId,
    required this.packageId,
    required this.addonIds,
    required this.paymentStatus,
    required this.totalPrice,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      childName: json['child_name'],
      birthdayDate: json['birthday_date'],
      location: json['location'],
      themeId: json['theme_id'],
      packageId: json['package_id'],
      addonIds: List<int>.from(json['addons'] ?? []), // adjust depending on backend shape
      paymentStatus: json['payment_status'],
      totalPrice: double.parse(json['total_price'].toString()),
      userId: json['user_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'child_name': childName,
      'birthday_date': birthdayDate,
      'location': location,
      'theme_id': themeId,
      'package_id': packageId,
      'addons': addonIds, // send as array of int
      'payment_status': paymentStatus,
      'total_price': totalPrice,
      'user_id': userId,
    };
  }
}
