import 'package:flutter/material.dart';
import 'dart:async';
import 'package:grad/core/colors/app_colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.center,
      end: const Alignment(0.1, -0.88),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Timer(const Duration(seconds: 1), () {
      _controller.forward();

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/');
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarker,
      body: AnimatedBuilder(
        animation: _alignmentAnimation,
        builder: (context, child) {
          return Align(
            alignment: _alignmentAnimation.value,
            child: child,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.surface,
              backgroundImage: const AssetImage('assets/app.png'),
            ),
            const SizedBox(height: 7),
            const Text(
              '  ThreatVision  ',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 25,
                fontFamily: 'Silom',
              ),
            ),
            const Text(
              '                       .AI',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 25,
                fontFamily: 'Silom',
              ),
            ),
          ],
        ),
      ),
    );
  }
}