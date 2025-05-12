import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const Color _primaryColor = Color(0xFF00A89D);
  static const double _headerFraction = 0.60;
  static const double _overlap = 32;
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
          // ─── 1) GREEN HEADER WITH LOGO + TITLE ──────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: headerHeight,
              color: _primaryColor,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _hPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),

                      // 1. Three dots
                      Row(
                        children: List.generate(
                          3,
                          (i) => Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.only(right: i < 2 ? 6 : 0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      // 2. Logo
                      Center(
                        child: Image.asset(
                          'assets/logo_login.png',
                          width: 250,
                          height: 250,
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Spacer(flex: 2),

                      // 4. Text fields over the green header
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

                      const SizedBox(height: _overlap),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ─── 2) OVERLAPPING WHITE CARD ─────────────────────────
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
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: _primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
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
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('or'),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () {},
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
}
