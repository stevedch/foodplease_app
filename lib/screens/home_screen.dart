import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topCategories = [
      {'label': 'Menu', 'icon': Icons.restaurant_menu},
      {'label': 'Pizza', 'icon': Icons.local_pizza},
      {'label': 'Beverages', 'icon': Icons.local_drink},
      {'label': 'Soups', 'icon': Icons.ramen_dining},
    ];

    final popularCategories = [
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
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            width: double.infinity,
            color: const Color(0xFF00A89D),
            child: Row(
              children: const [
                Icon(Icons.home, color: Colors.white),
                SizedBox(width: 8),
                Text('Home', style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          ),

          // ── BODY ──
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── TOP CATEGORY NAV ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: topCategories.map((item) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFFE1F4F3),
                            child: Icon(item['icon'] as IconData, color: Color(0xFF00A89D)),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // LEFT
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Deal of the day',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 4),
                              const Text('Pizza + drink', style: TextStyle(fontSize: 16)),
                              const SizedBox(height: 8),
                              const Text('\$ 5.99',
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  elevation: 4,
                                  shadowColor: Colors.black38,
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

                        // RIGHT IMAGE
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

                  // ── POPULAR CATEGORIES ──
                  const Text('Popular Categories',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: popularCategories.map((item) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFFE1F4F3),
                            child: Icon(item['icon'] as IconData, color: Color(0xFF00A89D)),
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
                            Text('Salads',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text('\$ 6.99',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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

      // ── BOTTOM NAVIGATION ──
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00A89D),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }
}