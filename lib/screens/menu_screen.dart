import 'package:flutter/material.dart';
import 'package:foodplease_app/widgets/product_card.dart';

import 'cart_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Pizza',
      'Salads',
      'Burgers',
      'Beverages',
      'Soups',
      'Desserts',
      'Snacks',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodPlease Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return Chip(label: Text(categories[index]));
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Deal of the Day',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: const [
                  ProductCard(
                    name: 'Pepperoni Pizza',
                    description:
                        'A classic pizza with pepperoni, tomato, and basil.',
                    price: 45.99,
                  ),
                  ProductCard(
                    name: 'Caesar Salad',
                    description:
                        'Fresh romaine, croutons, parmesan, and Caesar dressing.',
                    price: 25.99,
                  ),
                  ProductCard(
                    name: 'American Burger',
                    description: 'Beef patty, cheddar cheese, lettuce, tomato.',
                    price: 15.99,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
