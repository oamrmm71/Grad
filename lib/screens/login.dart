import 'package:flutter/material.dart';
import 'package:grad/core/app_colors.dart';
import 'package:grad/core/widgets/role_card.dart';
import 'package:grad/core/widgets/input_field.dart';
import 'package:grad/core/widgets/action_button.dart';
import 'package:grad/core/widgets/field_title.dart';
import 'package:grad/screens/it_home_screen.dart';
import 'package:grad/screens/manager_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = 'MANAGER';

  void _login() {
    if (selectedRole == 'MANAGER') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ManagerHomeScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ITHomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),

            Image.asset('assets/logo.png', width: 100),

            const SizedBox(height: 12),

            Text(
              'A-MSSP',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondaryBackground,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: RoleCard(
                          title: 'MANAGER',
                          icon: Icons.admin_panel_settings,
                          isSelected: selectedRole == 'MANAGER',
                          onTap: () => setState(() => selectedRole = 'MANAGER'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RoleCard(
                          title: 'IT',
                          icon: Icons.computer,
                          isSelected: selectedRole == 'IT',
                          onTap: () => setState(() => selectedRole = 'IT'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const FieldTitle("ID"),
                  const InputField(),

                  const SizedBox(height: 15),

                  const FieldTitle("PASSWORD"),
                  const InputField(obscure: true),

                  const SizedBox(height: 15),

                  ActionButton(
                    icon: Icons.fingerprint,
                    text: "SWITCH TO BIOMETRIC",
                    onTap: () {},
                  ),

                  const SizedBox(height: 15),

                  ActionButton(
                    icon: Icons.login,
                    text: "AUTHORIZE ACCESS",
                    onTap: _login,
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Protect By CyberGuard',
                    style: TextStyle(color: AppColors.background),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}