import 'package:flutter/material.dart';
import 'package:grad/core/colors/app_colors.dart';
import 'login.dart';

class It extends StatefulWidget {
  const It({super.key});

  @override
  State<It> createState() => _ItState();
}

class _ItState extends State<It> {
  final TextEditingController engineerNameController = TextEditingController();
  final TextEditingController engineerIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    engineerNameController.dispose();
    engineerIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.accentPurple),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
      ),
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.textSecondary),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarker,
      body: Column(
        children: [
          Container(
            height: 190,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 110,
                      height: 105,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.logo.withOpacity(0.75),
                            AppColors.logo.withOpacity(0.35),
                            Colors.transparent,
                          ],
                          stops: const [0.2, 0.72, 1],
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/app.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                const Text(
                  'A-MSSP',
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
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.backgroundDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.surface,
                              border: Border.all(color: AppColors.accentPurple),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.backgroundDarker,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Login(),
                                        ),
                                      );
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 14,
                                        horizontal: 30,
                                      ),
                                      child: Text(
                                        "Owner",
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 14,
                                        horizontal: 30,
                                      ),
                                      child: Text(
                                        "IT",
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 110),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundDarker,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.accentPurple),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: engineerNameController,
                              decoration: _inputDecoration("Engineer Name"),
                              style: const TextStyle(color: AppColors.textPrimary),
                            ),
                            const SizedBox(height: 14),
                            TextField(
                              controller: engineerIdController,
                              decoration: _inputDecoration("Engineer ID"),
                              style: const TextStyle(color: AppColors.textPrimary),
                            ),
                            const SizedBox(height: 14),
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: _inputDecoration("Password"),
                              style: const TextStyle(color: AppColors.textPrimary),
                            ),
                            const SizedBox(height: 14),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                foregroundColor: AppColors.secondary,
                              ),
                              child: const Text("Forget Password?"),
                            ),
                            const SizedBox(height: 7),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}