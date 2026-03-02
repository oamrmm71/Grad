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

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.center,
      end: const Alignment(0.05, -0.84),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Timer(const Duration(seconds: 1), () {
      if (!mounted) return;
      _controller.forward();

      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
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
          children: const [
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.surface,
              backgroundImage: AssetImage('assets/app.png'),
            ),
            SizedBox(height: 7),
            Text(
              'ThreatVision',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 25,
                fontFamily: 'Silom',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2),
            Text(
              '.AI',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 25,
                fontFamily: 'Silom',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}