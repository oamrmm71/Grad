import 'package:flutter/material.dart';
import '../app_colors.dart';

class InputField extends StatelessWidget {
  final bool obscure;

  const InputField({super.key, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      cursorColor: AppColors.textPrimary,
      style: const TextStyle(
        color: AppColors.secondaryBackground,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.background,

        hintStyle: TextStyle(
          color: AppColors.secondaryBackground.withOpacity(0.6),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.textPrimary),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.textPrimary),
        ),
      ),
    );
  }
}