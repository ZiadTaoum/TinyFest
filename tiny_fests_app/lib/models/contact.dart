class ContactInfo {
  final String phone;
  final String email;
  final String address;

  ContactInfo({
    required this.phone,
    required this.email,
    required this.address,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
    );
  }
}

class Faq {
  final int id;
  final String question;
  final String answer;
  final bool isActive;

  Faq({
    required this.id,
    required this.question,
    required this.answer,
    required this.isActive,
  });

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
      isActive: json['is_active'],
    );
  }
}