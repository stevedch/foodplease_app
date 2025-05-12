import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const Color primaryColor = Color(0xFF00A89D);

  @override
  Widget build(BuildContext context) {
    final topCategories = [
      {'label': 'Menu',      'icon': Icons.restaurant_menu},
      {'label': 'Pizza',     'icon': Icons.local_pizza},
      {'label': 'Beverages', 'icon': Icons.local_drink},
      {'label': 'Soups',     'icon': Icons.ramen_dining},
    ];

    final popularCategories = [
      {'label': 'Burgers', 'icon': Icons.lunch_dining},
      {'label': 'Salads',  'icon': Icons.rice_bowl},
      {'label': 'Deserts', 'icon': Icons.cake},
      {'label': 'Snacks',  'icon': Icons.fastfood},
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      // ── HEADER ──
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: const [
                    Icon(Icons.home, color: Colors.white, size: 28),
                    SizedBox(width: 12),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── BODY ──
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top category nav
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: topCategories.map((item) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFFE1F4F3),
                            child: Icon(item['icon'] as IconData, color: primaryColor),
                          ),
                          const SizedBox(height: 4),
                          Text(item['label'] as String),
                        ],
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Deal of the day
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6C5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left: text + button
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Deal of the day',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Pizza + drink',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '\$ 5.99',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  elevation: 4,
                                  shadowColor: Colors.black38,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text('Order Now'),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Right: image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/pizza.png',
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Popular categories header
                  const Text(
                    'Popular Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // Popular categories nav
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: popularCategories.map((item) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFFE1F4F3),
                            child: Icon(item['icon'] as IconData, color: primaryColor),
                          ),
                          const SizedBox(height: 4),
                          Text(item['label'] as String),
                        ],
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Featured product
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9F0EA),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/salad.png',
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Salads',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$ 6.99',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // ── FOOTER ──
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, -1)),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                  color: primaryColor,
                  iconSize: 28,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_outlined),
                  color: Colors.grey,
                  iconSize: 26,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline),
                  color: Colors.grey,
                  iconSize: 26,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                  color: Colors.grey,
                  iconSize: 26,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}