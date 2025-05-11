import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF00A89D);
    final double height = MediaQuery.of(context).size.height * 0.45;

    return Container(
      height: height,
      width: double.infinity,
      color: backgroundColor,
      child: Stack(
        children: [
          // ● Top bar: tres puntos a la izquierda y avioneta a la derecha
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    _dot(), const SizedBox(width: 4),
                    _dot(), const SizedBox(width: 4),
                    _dot(),
                  ]),
                  const Icon(Icons.send, color: Colors.white, size: 24),
                ],
              ),
            ),
          ),

          // ● Círculo grande degradado
          Center(
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
              ),
            ),
          ),

          // ● Círculo interior con borde blanco y el icono/logo
          Center(
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                color: Colors.transparent,
              ),
              child: const Center(
                // Reemplaza Icon por Image.asset si tienes tu propio logo
                child: Icon(Icons.restaurant, size: 60, color: Colors.white),
              ),
            ),
          ),

          // ● Título y subtítulo abajo
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Text(
                  'FoodPlease',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'DELIVERY APP',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot() => const CircleAvatar(radius: 4, backgroundColor: Colors.white);
}