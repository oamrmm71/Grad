import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController managerNameController = TextEditingController();
  final TextEditingController managerIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final AnimationController animationController;
  late final Animation<Offset> slideAnimation;

  void init({
    required TickerProvider vsync,
    required bool animate,
  }) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 800),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    if (animate) {
      animationController.forward();
    } else {
      animationController.value = 1;
    }
  }

  void dispose() {
    animationController.dispose();
    managerNameController.dispose();
    managerIdController.dispose();
    passwordController.dispose();
  }
}