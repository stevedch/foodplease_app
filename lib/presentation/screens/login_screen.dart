import 'package:flutter/material.dart';
import '../widgets/login/login_header.dart';
import '../widgets/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const double _headerFraction = 0.60;
  static const double _overlap = 32;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double headerHeight = screen.height * _headerFraction;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LoginHeader(headerHeight: headerHeight, overlap: _overlap),
          ),
          Positioned(
            top: headerHeight - _overlap,
            left: 0,
            right: 0,
            bottom: 0,
            child: const LoginForm(),
          ),
        ],
      ),
    );
  }
}
