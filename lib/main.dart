import 'package:flutter/material.dart';
import 'core/app_colors.dart';
import 'screens/login.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: '/Splash',
      routes: {
        '/Splash': (context) => const Splash(),
        '/LoginScreen': (context) => const LoginScreen(),
      },
    );
  }
}