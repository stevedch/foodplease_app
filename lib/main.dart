import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const FoodPleaseApp());
}

class FoodPleaseApp extends StatelessWidget {
  const FoodPleaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodPlease',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
