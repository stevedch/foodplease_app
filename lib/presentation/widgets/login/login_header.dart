import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_field.dart';
import '../../../presentation/blocs/login/login_cubit.dart';

class LoginHeader extends StatelessWidget {
  final double headerHeight;
  final double overlap;

  static const Color _primaryColor = Color(0xFF00A89D);
  static const double _hPadding = 32;
  static const double _fieldGap = 16;
  static const double _borderRadius = 32;
  static const double _fieldHeight = 56;

  const LoginHeader({
    super.key,
    required this.headerHeight,
    required this.overlap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      color: _primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: _hPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
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
              Center(
                child: Image.asset(
                  'assets/logo_login.png',
                  width: 800,
                  height: 270,
                ),
              ),
              const SizedBox(height: 16),
              const Spacer(flex: 2),
              LoginField(
                icon: Icons.person_outline,
                hint: 'Email or Phone',
                height: _fieldHeight,
                borderRadius: _borderRadius,
                fieldKey: const Key('emailTextField'),
                onChanged: (value) =>
                    context.read<LoginCubit>().updateEmail(value),
              ),
              const SizedBox(height: _fieldGap),
              LoginField(
                icon: Icons.lock_outline,
                hint: 'Password',
                obscure: true,
                height: _fieldHeight,
                borderRadius: _borderRadius,
                fieldKey: const Key('passwordTextField'),
                onChanged: (value) =>
                    context.read<LoginCubit>().updatePassword(value),
              ),
              SizedBox(height: overlap),
            ],
          ),
        ),
      ),
    );
  }
}