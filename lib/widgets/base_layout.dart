import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';

class BaseLayout extends StatelessWidget {
  final String title;
  final IconData headerIcon;
  final int currentIndex;
  final Widget child;

  const BaseLayout({
    super.key,
    required this.title,
    required this.headerIcon,
    required this.currentIndex,
    required this.child,
  });

  static const Color primaryColor = Color(0xFF00A89D);

  @override
  Widget build(BuildContext context) {
    Color iconColor(int index) =>
        index == currentIndex ? primaryColor : Colors.grey;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ── HEADER ──
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Icon(headerIcon, color: Colors.white, size: 28),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: const TextStyle(
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

          // ── CONTENT ──
          Expanded(child: child),
        ],
      ),

      // ── FOOTER ──
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Home
                IconButton(
                  onPressed: () {
                    if (currentIndex != 0) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    }
                  },
                  icon: const Icon(Icons.home),
                  color: iconColor(0),
                  iconSize: 28,
                ),
                // Search
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_outlined),
                  color: iconColor(1),
                  iconSize: 26,
                ),
                // Profile
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline),
                  color: iconColor(2),
                  iconSize: 26,
                ),
                // Cart
                IconButton(
                  onPressed: () {
                    if (currentIndex != 3) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const CartScreen()),
                      );
                    }
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                  color: iconColor(3),
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
