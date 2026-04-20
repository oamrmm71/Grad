import 'package:flutter/material.dart';
import 'package:grad/core/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = 'Manager';

  OutlineInputBorder _greenBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.textPrimary),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Column(
                children: [
                  Image.asset('assets/logo.png', width: 100),
                  const SizedBox(height: 12),
                  const FittedBox(
                    child: Text(
                      'A-MSSP',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.secondaryBackground,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _roleCard('MANAGER', Icons.admin_panel_settings)),
                      const SizedBox(width: 12),
                      Expanded(child: _roleCard('IT', Icons.computer)),
                    ],
                  ),
                  const SizedBox(height: 25),
                  _fieldTitle("ID"),
                  _inputField(),
                  const SizedBox(height: 15),
                  _fieldTitle("PASSWORD"),
                  _inputField(obscure: true),
                  const SizedBox(height: 15),
                  _inputActionField(
                    icon: Icons.fingerprint,
                    text: "SWITCH TO BIOMETRIC",
                  ),
                  const SizedBox(height: 15),
                  _inputActionField(
                    icon: Icons.login,
                    text: "AUTHORIZE ACCESS",
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Protect By CyberGuard',
                    style: TextStyle(
                      color: AppColors.background,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roleCard(String title, IconData icon) {
    final isSelected = selectedRole == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = title;
        });
      },
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.textPrimary : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.textPrimary
                          : AppColors.secondaryBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "ACCESS",
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected
                          ? AppColors.textPrimary
                          : AppColors.secondaryBackground.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              icon,
              color: isSelected
                  ? AppColors.textPrimary
                  : AppColors.secondaryBackground,
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField({bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: AppColors.secondaryBackground),
      cursorColor: AppColors.textPrimary,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.background,
        enabledBorder: _greenBorder(),
        focusedBorder: _greenBorder(),
      ),
    );
  }

  Widget _inputActionField({required IconData icon, required String text}) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.textPrimary),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(color: AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}