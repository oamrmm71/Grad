import 'package:flutter/material.dart';
import 'package:grad/core/app_colors.dart';

class RoleWidget extends StatelessWidget {
  final String role;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleWidget({
    super.key,
    required this.role,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.green
              : AppColors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            role,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}