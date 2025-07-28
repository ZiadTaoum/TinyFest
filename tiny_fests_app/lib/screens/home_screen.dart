import 'package:flutter/material.dart';
// Import your other screens here when you create them
// import '../screens/booking/booking_wizard_screen.dart';
// import 'events_screen.dart';
// import 'portfolio_screen.dart';
// import 'dream_party_screen.dart';
// import 'contact_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF6B9D).withOpacity(0.1),
              Color(0xFFFFD93D).withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                SizedBox(height: 30),
                _buildMainActionCard(context),
                SizedBox(height: 30),
                _buildQuickActionsSection(context),
                SizedBox(height: 30),
                _buildTestimonialsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '✨ Welcome to',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'Tiny Fests',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: [Color(0xFFFF6B9D), Color(0xFFFFD93D)],
                  ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF6B9D), Color(0xFFFFD93D)],
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notifications
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('No new notifications! 🎉'),
                  backgroundColor: Color(0xFFFF6B9D),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMainActionCard(BuildContext context) {
    return GestureDetector(
onTap: () {
  Navigator.pushNamed(context, '/booking');
},

      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF6B9D), Color(0xFFFFD93D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFFF6B9D).withOpacity(0.3),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🎂 Book a Birthday Party',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Create magical moments with our themed celebrations!',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 15),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.2,
          children: [
  _buildQuickActionCard(
    '🎪 Special Events',
    'Upcoming monthly celebrations',
    Color(0xFF9C27B0),
    () => Navigator.pushNamed(context, '/events'),
  ),
  _buildQuickActionCard(
    '📸 Our Portfolio',
    'See our magical moments',
    Color(0xFF2196F3),
    () => Navigator.pushNamed(context, '/portfolio'),
  ),
  _buildQuickActionCard(
    '🎨 Dream Party',
    'Create your moodboard',
    Color(0xFF4CAF50),
    () => Navigator.pushNamed(context, '/dream-party'),
  ),
  _buildQuickActionCard(
    '💬 Get in Touch',
    'WhatsApp • Call • Email',
    Color(0xFFFF9800),
    () => Navigator.pushNamed(context, '/contact'),
  ),
],

        ),
      ],
    );
  }

  Widget _buildQuickActionCard(String title, String subtitle, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.2), width: 2),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonialsSection() {
    final testimonials = [
      {
        'name': 'Sarah M.',
        'text': 'Amazing unicorn party! My daughter was absolutely thrilled. The team made everything magical! ✨',
        'avatar': '👑',
      },
      {
        'name': 'Mike D.',
        'text': 'Professional service and incredible decorations. The kids had a blast with the superhero theme! 🦸',
        'avatar': '🌟',
      },
      {
        'name': 'Lisa K.',
        'text': 'Best birthday party ever! The princess castle theme was perfect. Thank you for making it special! 👑',
        'avatar': '💖',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '💛 Happy Families',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: testimonials.length,
            itemBuilder: (context, index) {
              final testimonial = testimonials[index];
              return Container(
                width: 280,
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFFFFD93D),
                          child: Text(
                            testimonial['avatar']!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              testimonial['name']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: List.generate(
                                5,
                                (i) => Icon(
                                  Icons.star,
                                  color: Color(0xFFFFD93D),
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Expanded(
                      child: Text(
                        '"${testimonial['text']}"',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // void _showComingSoonDialog(BuildContext context, String feature) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Container(
  //               padding: EdgeInsets.all(20),
  //               decoration: BoxDecoration(
  //                 gradient: LinearGradient(
  //                   colors: [Color(0xFFFF6B9D), Color(0xFFFFD93D)],
  //                 ),
  //                 shape: BoxShape.circle,
  //               ),
  //               child: Icon(Icons.construction, color: Colors.white, size: 40),
  //             ),
  //             SizedBox(height: 20),
  //             Text(
  //               '🚧 Coming Soon!',
  //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(height: 10),
  //             Text(
  //               '$feature is under development. Create the separate screen file and connect it here!',
  //               style: TextStyle(color: Colors.grey[600]),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(height: 20),
  //             ElevatedButton(
  //               onPressed: () => Navigator.of(context).pop(),
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: Color(0xFFFF6B9D),
  //                 foregroundColor: Colors.white,
  //               ),
  //               child: Text('Got it!'),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}

// Add this import placeholder for ContactScreen
// For now, create a simple placeholder:
class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('💬 Get in Touch'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Contact Screen - Create contact_screen.dart',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}