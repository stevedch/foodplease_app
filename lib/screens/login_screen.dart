import 'package:flutter/material.dart';
import 'package:foodplease_app/widgets/header_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // Colores y constantes
  static const Color _primaryColor = Color(0xFF00A89D);
  static const double _headerFraction =
      0.60; // ← 60% de alto para que el verde baje más
  static const double _overlap = 32; // solapamiento de la curva
  static const double _fieldHeight = 56;
  static const double _fieldGap = 16;
  static const double _borderRadius = 32;
  static const double _hPadding = 32;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double headerHeight = screen.height * _headerFraction;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // ─── 1) HEADER VERDE ────────────────────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: headerHeight,
              width: double.infinity,
              color: _primaryColor,
              child: SafeArea(
                child: Column(
                  children: [
                    // • Barra superior: puntos y avioneta
                    /*Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            _dot(),
                            const SizedBox(width: 4),
                            _dot(),
                            const SizedBox(width: 4),
                            _dot(),
                          ]),
                          const Icon(Icons.send,
                              color: Colors.white, size: 24),
                        ],
                      ),
                    ),*/

                    // • Logo circular degradado + texto
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /*Container(
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
                              child: Center(
                                child: Container(
                                  width: 140,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 4),
                                  ),
                                  child: const Icon(Icons.restaurant,
                                      size: 60, color: Colors.white),
                                ),
                              ),
                            ),*/
                            const SizedBox(height: 16),
                            const Text(
                              'FoodPlease',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'DELIVERY APP',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // • Campos de texto dentro del verde
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _hPadding,
                      ),
                      child: Column(
                        children: [
                          _buildField(
                            icon: Icons.person_outline,
                            hint: 'Email or Phone',
                          ),
                          const SizedBox(height: _fieldGap),
                          _buildField(
                            icon: Icons.lock_outline,
                            hint: 'Password',
                            obscure: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: _overlap),
                  ],
                ),
              ),
            ),
          ),

          // ─── 2) TARJETA BLANCA SOLAPADA ─────────────────────────
          Positioned(
            top: headerHeight - _overlap,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: _overlap,
                left: _hPadding,
                right: _hPadding,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(_borderRadius),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Forgot Password?
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          // Navegar a ForgotPasswordScreen
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: _primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Botón Login
                    ElevatedButton(
                      onPressed: () {
                        // Navegar a MenuScreen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_borderRadius),
                        ),
                        elevation: 4,
                        shadowColor: Colors.black26,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Separator “or”
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade300,
                            height: 1,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('or'),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade300,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Create an account
                    OutlinedButton(
                      onPressed: () {
                        // Navegar a RegisterScreen
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: _primaryColor),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_borderRadius),
                        ),
                        elevation: 4,
                        shadowColor: Colors.black26,
                      ),
                      child: const Text(
                        'Create an account',
                        style: TextStyle(color: _primaryColor, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField({
    required IconData icon,
    required String hint,
    bool obscure = false,
  }) {
    return SizedBox(
      height: _fieldHeight,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: TextField(
          obscureText: obscure,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.white),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white70),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }

  Widget _dot() => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 2),
    child: CircleAvatar(radius: 4, backgroundColor: Colors.white),
  );
}
