import 'package:flutter/material.dart';

import '../widgets/common/base_layout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock cart data — you can replace this with real data later
    final cartItems = [
      {'name': 'Pepperoni Pizza', 'price': 45.99, 'quantity': 1},
      {'name': 'American Burger', 'price': 15.99, 'quantity': 1},
      {'name': 'Caesar Salad', 'price': 25.99, 'quantity': 1},
    ];

    final total = cartItems.fold<double>(
      0,
      (sum, item) =>
          sum + (item['price'] as double) * (item['quantity'] as int),
    );

    return BaseLayout(
      title: '',
      headerIcon: Icons.shopping_cart_outlined,
      currentIndex: 3,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
