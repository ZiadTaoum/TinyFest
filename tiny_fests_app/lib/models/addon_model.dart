class AddonModel {
  final int id;
  final String name;
  final double price;
  final String? icon;

  AddonModel({
    required this.id,
    required this.name,
    required this.price,
    this.icon,
  });

  factory AddonModel.fromJson(Map<String, dynamic> json) {
    return AddonModel(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'icon': icon,
    };
  }
}
