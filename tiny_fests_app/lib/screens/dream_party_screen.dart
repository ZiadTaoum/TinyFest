import 'package:flutter/material.dart';
// import '../../models/theme_model.dart';
// import '../../services/theme_service.dart';

class DreamPartyScreen extends StatefulWidget {
  @override
  _DreamPartyScreenState createState() => _DreamPartyScreenState();
}

class _DreamPartyScreenState extends State<DreamPartyScreen> {
  List<Map<String, dynamic>> selectedItems = [];
  
  final moodboardItems = [
    {'emoji': '🦄', 'name': 'Unicorns', 'color': Color(0xFFFF6B9D)},
    {'emoji': '🌈', 'name': 'Rainbows', 'color': Color(0xFF9C27B0)},
    {'emoji': '⭐', 'name': 'Stars', 'color': Color(0xFFFFD93D)},
    {'emoji': '🎈', 'name': 'Balloons', 'color': Color(0xFF2196F3)},
    {'emoji': '🍰', 'name': 'Cake', 'color': Color(0xFFFF9800)},
    {'emoji': '🎪', 'name': 'Circus', 'color': Color(0xFF4CAF50)},
    {'emoji': '👑', 'name': 'Princess', 'color': Color(0xFF9C27B0)},
    {'emoji': '🦸', 'name': 'Superhero', 'color': Color(0xFF2196F3)},
    {'emoji': '🏰', 'name': 'Castle', 'color': Color(0xFF795548)},
    {'emoji': '🧚', 'name': 'Fairy', 'color': Color(0xFF4CAF50)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🎨 Dream Party Creator'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF6B9D).withOpacity(0.1), Color(0xFFFFD93D).withOpacity(0.1)],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Instructions
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Swipe right on items you love to build your dream party moodboard! ✨',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          
          // Swipeable Cards
          Expanded(
            child: PageView.builder(
              itemCount: moodboardItems.length,
              itemBuilder: (context, index) {
                final item = moodboardItems[index];
                return Container(
                  margin: EdgeInsets.all(20),
                  child: GestureDetector(
                    onPanEnd: (details) {
                      if (details.velocity.pixelsPerSecond.dx > 0) {
                        // Swiped right - add to moodboard
                        setState(() {
                          if (!selectedItems.contains(item)) {
                            selectedItems.add(item);
                          }
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${item['name'] as String} added to your moodboard! 💖'),
                            backgroundColor: Color(0xFFFF6B9D),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(40),
                            decoration: BoxDecoration(
                              color: (item['color'] as Color).withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              item['emoji'] as String,
                              style: TextStyle(fontSize: 80),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            item['name'] as String,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: item['color'] as Color,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.close, color: Colors.red, size: 16),
                                    SizedBox(width: 5),
                                    Text('Swipe Left', style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.favorite, color: Colors.green, size: 16),
                                    SizedBox(width: 5),
                                    Text('Swipe Right', style: TextStyle(color: Colors.green)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Selected Items Preview
          if (selectedItems.isNotEmpty)
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💖 Your Dream Party Moodboard',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedItems.length,
                      itemBuilder: (context, index) {
                        final item = selectedItems[index];
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: (item['color'] as Color).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: item['color'] as Color, width: 2),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item['emoji'] as String, style: TextStyle(fontSize: 20)),
                              Text(
                                item['name'] as String,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: item['color'] as Color,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            title: Text('🎉 Moodboard Complete!'),
                            content: Text('Your dream party ideas have been saved! We\'ll use these to create the perfect celebration for you.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Share with Friends'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF6B9D)),
                                child: Text('Book This Theme', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.save_alt, color: Colors.white),
                      label: Text(
                        'Save My Dream Party',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF6B9D),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}