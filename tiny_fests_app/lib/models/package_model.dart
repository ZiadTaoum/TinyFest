class PackageModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final bool isActive;

  PackageModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isActive,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      isActive: json['is_active'] == 1 || json['is_active'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'is_active': isActive,
    };
  }
}
