import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/it.dart';
import 'screens/splash.dart';
import 'screens/home.dart';


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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const Splash(),
        '/': (context) => const Login(),
        '/it': (context) => const It(),
        '/Home': (context) => const Home(),
      },
    );
  }

}