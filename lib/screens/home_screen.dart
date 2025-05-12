import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'label': 'Menu', 'icon': Icons.restaurant_menu},
      {'label': 'Pizza', 'icon': Icons.local_pizza},
      {'label': 'Beverages', 'icon': Icons.local_drink},
      {'label': 'Soups', 'icon': Icons.ramen_dining},
    ];

    final popular = [
      {'label': 'Burgers', 'icon': Icons.lunch_dining},
      {'label': 'Salads', 'icon': Icons.rice_bowl},
      {'label': 'Deserts', 'icon': Icons.cake},
      {'label': 'Snacks', 'icon': Icons.fastfood},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ── HEADER ──
          Container(
            padding: const EdgeInsets.only(
              top: 48,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            width: double.infinity,
            color: const Color(0xFF00A89D),
            child: Row(
              children: const [
                Icon(Icons.home, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── NAVIGATION CATEGORIES ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        categories.map((item) {
                          return Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xFFE1F4F3),
                                child: Icon(
                                  item['icon'] as IconData,
                                  color: const Color(0xFF00A89D),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(item['label'] as String),
                            ],
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // ── DEAL OF THE DAY ──
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6C5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Deal of the day',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Pizza + drink',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '\$ 5.99',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text('Order Now'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 200,
                          child: Image.asset(
                            'assets/pizza.png',
                          ), // Usa tu imagen propia
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── POPULAR CATEGORIES ──
                  const Text(
                    'Popular Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        popular.map((item) {
                          return Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xFFE1F4F3),
                                child: Icon(
                                  item['icon'] as IconData,
                                  color: const Color(0xFF00A89D),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(item['label'] as String),
                            ],
                          );
                        }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // ── FEATURED PRODUCT ──
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9F0EA),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Image.asset(
                            'assets/salad.png',
                          ), // Usa tu imagen propia
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Salads',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$ 6.99',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
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

      // ── BOTTOM NAVIGATION BAR ──
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00A89D),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }
}
