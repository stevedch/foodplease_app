import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    child: ListTile(
                      title: Text(item['name'] as String),
                      subtitle: Text('Quantity: ${item['quantity']}'),
                      trailing: Text(
                        '\$${(item['price'] as double).toStringAsFixed(2)}',
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Checkout not implemented')),
                  );
                },
                child: const Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
