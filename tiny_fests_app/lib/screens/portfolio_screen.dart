import 'package:flutter/material.dart';
// import '../../models/theme_model.dart';
// import '../../services/theme_service.dart';


class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Birthdays', 'School Events', 'Seasonal'];
    final List<Map<String, dynamic>> portfolioItems = [
  {'title': 'Unicorn Dream Party', 'category': 'Birthdays', 'image': '🦄'},
  {'title': 'Superhero Training', 'category': 'Birthdays', 'image': '🦸'},
  {'title': 'School Carnival', 'category': 'School Events', 'image': '🎪'},
  {'title': 'Halloween Bash', 'category': 'Seasonal', 'image': '🎃'},
  {'title': 'Princess Castle', 'category': 'Birthdays', 'image': '👑'},
  {'title': 'Christmas Magic', 'category': 'Seasonal', 'image': '🎄'},
];

final List<Map<String, dynamic>> testimonials = [
  {
    'name': 'Sarah M.',
    'text': 'Absolutely magical experience! The kids were thrilled.',
    'rating': 5
  },
  {
    'name': 'Mike D.',
    'text': 'Professional team, amazing decorations, highly recommend!',
    'rating': 5
  },
  {
    'name': 'Lisa K.',
    'text': 'Best birthday party ever! Thank you for making it special.',
    'rating': 5
  },
];


    return Scaffold(
      appBar: AppBar(
        title: Text('📸 Our Portfolio'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF6B9D).withOpacity(0.1), Color(0xFFFFD93D).withOpacity(0.1)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Filter
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: FilterChip(
                      label: Text(categories[index]),
                      selected: index == 0,
                      onSelected: (selected) {},
                      selectedColor: Color(0xFFFF6B9D).withOpacity(0.2),
                      checkmarkColor: Color(0xFFFF6B9D),
                    ),
                  );
                },
              ),
            ),
            
            // Portfolio Grid
            Padding(
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8,
                ),
                itemCount: portfolioItems.length,
                itemBuilder: (context, index) {
                  final item = portfolioItems[index];
                  return Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFFF6B9D).withOpacity(0.3), Color(0xFFFFD93D).withOpacity(0.3)],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                item['image']!,
                                style: TextStyle(fontSize: 60),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                item['category']!,
                                style: TextStyle(
                                  color: Color(0xFFFF6B9D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            // Testimonials Section
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💛 What Parents Say',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
...List.generate(testimonials.length, (index) {
  final testimonial = testimonials[index];

                    
                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.all(20),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFFFFD93D),
                                child: Text('👑', style: TextStyle(fontSize: 16)),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      testimonial['name']!,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    Row(
                                      children: List.generate(5, (i) => 
                                        Icon(Icons.star, color: Color(0xFFFFD93D), size: 16)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            '"${testimonial['text']}"',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}