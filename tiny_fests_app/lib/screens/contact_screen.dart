import 'package:flutter/material.dart';
// Add these imports for URL launching when you add the dependencies:
// import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('💬 Get in Touch'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF6B9D).withOpacity(0.1),
                Color(0xFFFFD93D).withOpacity(0.1)
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 30),
            _buildContactMethods(),
            SizedBox(height: 30),
            _buildFAQSection(),
            SizedBox(height: 30),
            _buildQuickMessageForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'We\'re here to help! ✨',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Get in touch with our friendly team for any questions about your magical celebration.',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildContactMethods() {
    return Column(
      children: [
        _buildContactCard(
          icon: Icons.message,
          title: 'WhatsApp',
          subtitle: 'Quick responses • Available 9 AM - 8 PM',
          color: Color(0xFF25D366),
          onTap: () => _launchWhatsApp(),
        ),
        _buildContactCard(
          icon: Icons.phone,
          title: 'Call Us',
          subtitle: '+1 (555) 123-FEST • Mon-Sat 9 AM - 6 PM',
          color: Color(0xFF2196F3),
          onTap: () => _makePhoneCall(),
        ),
        _buildContactCard(
          icon: Icons.email,
          title: 'Email',
          subtitle: 'hello@tinyfests.com • Response within 24 hours',
          color: Color(0xFFFF9800),
          onTap: () => _sendEmail(),
        ),
      ],
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.arrow_forward, color: Colors.white, size: 20),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildFAQSection() {
    final faqs = [
      {
        'question': 'How far in advance should I book?',
        'answer': 'We recommend booking at least 2-3 weeks in advance to ensure availability of your preferred date and theme.'
      },
      {
        'question': 'What\'s included in the Basic package?',
        'answer': '2 hours of celebration, themed decorations, basic activities, and a dedicated party host.'
      },
      {
        'question': 'Can you accommodate food allergies?',
        'answer': 'Absolutely! Please let us know about any allergies or dietary restrictions when booking.'
      },
      {
        'question': 'Do you provide photography?',
        'answer': 'Professional photography is included in Premium and Custom packages. Basic packages can add it as an extra.'
      },
      {
        'question': 'What if it rains on the party day?',
        'answer': 'We have indoor venue options available, or we can reschedule at no extra cost.'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '❓ Frequently Asked Questions',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        ...faqs.map((faq) => Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                faq['question']!,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    faq['answer']!,
                    style: TextStyle(
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )).toList(),
      ],
    );
  }

  Widget _buildQuickMessageForm() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFF6B9D).withOpacity(0.1),
            Color(0xFFFFD93D).withOpacity(0.1)
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '💌 Send us a Quick Message',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            _buildFormField(
              controller: _nameController,
              labelText: 'Your Name',
              prefixIcon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            _buildFormField(
              controller: _emailController,
              labelText: 'Email',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            _buildFormField(
              controller: _messageController,
              labelText: 'Your Message',
              prefixIcon: Icons.message,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _sendMessage,
                icon: Icon(Icons.send, color: Colors.white),
                label: Text(
                  'Send Message',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6B9D),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon, color: Color(0xFFFF6B9D)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFFF6B9D), width: 2),
        ),
      ),
    );
  }

  void _launchWhatsApp() {
    // When you add url_launcher dependency, uncomment this:
    // final url = 'https://wa.me/15551234357?text=Hi! I\'d like to know more about Tiny Fests parties!';
    // launchUrl(Uri.parse(url));
    
    // For now, show a dialog:
    _showContactDialog('WhatsApp', 'Opening WhatsApp...\nAdd url_launcher dependency to make this work!');
  }

  void _makePhoneCall() {
    // When you add url_launcher dependency, uncomment this:
    // final url = 'tel:+15551234357';
    // launchUrl(Uri.parse(url));
    
    // For now, show a dialog:
    _showContactDialog('Phone', 'Calling +1 (555) 123-FEST...\nAdd url_launcher dependency to make this work!');
  }

  void _sendEmail() {
    // When you add url_launcher dependency, uncomment this:
    // final url = 'mailto:hello@tinyfests.com?subject=Party Inquiry&body=Hi! I\'d like to know more about your services.';
    // launchUrl(Uri.parse(url));
    
    // For now, show a dialog:
    _showContactDialog('Email', 'Opening email to hello@tinyfests.com...\nAdd url_launcher dependency to make this work!');
  }

  void _sendMessage() {
    if (_formKey.currentState!.validate()) {
      // Here you would typically send the message to your API
      // For now, just show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Message sent! We\'ll get back to you soon. 💖'),
          backgroundColor: Color(0xFFFF6B9D),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

      // Clear the form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  void _showContactDialog(String method, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('$method Contact'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Got it!',
                style: TextStyle(color: Color(0xFFFF6B9D)),
              ),
            ),
          ],
        );
      },
    );
  }
}