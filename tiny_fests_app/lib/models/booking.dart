class Booking {
  final String childName;
  final String birthdayDate;
  final String location;
  final String theme;
  final String package;
  final List<String> addons;
  final double totalPrice;

  Booking({
    required this.childName,
    required this.birthdayDate,
    required this.location,
    required this.theme,
    required this.package,
    required this.addons,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() => {
        'child_name': childName,
        'birthday_date': birthdayDate,
        'location': location,
        'theme': theme,
        'package': package,
        'addons': addons,
        'total_price': totalPrice.toStringAsFixed(2),
      };
}
