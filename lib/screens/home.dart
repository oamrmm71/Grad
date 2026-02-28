import 'package:flutter/material.dart';
import 'login.dart'; // Make sure this file exists
// ------------------ Home Page ------------------
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
          child: const Text('Go to Login'),
        ),
      ),
    );
  }
}
