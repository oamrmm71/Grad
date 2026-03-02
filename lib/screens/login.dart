import 'package:flutter/material.dart';
import '../core/colors/app_colors.dart';
import '../controllers/login_controller.dart';
import 'home.dart';

enum UserRole { owner, it }

class Login extends StatefulWidget {
  final bool animate;
  const Login({super.key, this.animate = false});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final LoginController c = LoginController();
  UserRole role = UserRole.owner;

  @override
  void initState() {
    super.initState();
    c.init(vsync: this, animate: widget.animate);
  }

  @override
  void dispose() {
    c.dispose();
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
    final isOwner = role == UserRole.owner;

    final field1Hint = isOwner ? "Manager Name" : "Engineer Name";
    final field2Hint = isOwner ? "Manager ID" : "Engineer ID";

    return Scaffold(
      backgroundColor: AppColors.backgroundDarker,
      body: Column(
        children: [
          // Top Logo Section (unchanged)
          Container(
            height: 190,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                            AppColors.logo.withOpacity(0.7),
                            AppColors.logo.withOpacity(0.3),
                            Colors.transparent,
                          ],
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
                const SizedBox(height: 8),
                const Text(
                  'A-MSSP',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 25,
                    fontFamily: 'Silom',
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SlideTransition(
              position: c.slideAnimation,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.backgroundDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                // Scrollable
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // ✅ Smooth role switch WITHOUT changing screen
                      _RoleSwitch(
                        role: role,
                        onChange: (newRole) => setState(() => role = newRole),
                      ),

                      const SizedBox(height: 40),

                      // Form Card (same card, only hints change smoothly)
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundDarker,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            // ✅ Smooth switch for the first 2 fields text/hints
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              switchInCurve: Curves.easeOut,
                              switchOutCurve: Curves.easeIn,
                              transitionBuilder: (child, anim) {
                                return FadeTransition(
                                  opacity: anim,
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0.03, 0),
                                      end: Offset.zero,
                                    ).animate(anim),
                                    child: child,
                                  ),
                                );
                              },
                              child: Column(
                                key: ValueKey(role), // important
                                children: [
                                  TextField(
                                    controller: c.managerNameController,
                                    decoration: _inputDecoration(field1Hint),
                                    style: const TextStyle(
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  TextField(
                                    controller: c.managerIdController,
                                    decoration: _inputDecoration(field2Hint),
                                    style: const TextStyle(
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16),

                            TextField(
                              controller: c.passwordController,
                              obscureText: true,
                              decoration: _inputDecoration("Password"),
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                              ),
                            ),

                            const SizedBox(height: 16),

                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.secondary,
                              ),
                              child: const Text("Forget Password?"),
                            ),

                            const SizedBox(height: 10),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // ✅ For now: both roles go to Home
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (_) => const Home()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  isOwner ? "Login as Owner" : "Login as IT",
                                  style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
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

// Small switch widget (smooth + no rebuild of whole screen)
class _RoleSwitch extends StatelessWidget {
  const _RoleSwitch({
    required this.role,
    required this.onChange,
  });

  final UserRole role;
  final ValueChanged<UserRole> onChange;

  @override
  Widget build(BuildContext context) {
    final isOwner = role == UserRole.owner;

    return Container(
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.surface,
        border: Border.all(color: AppColors.accentPurple),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            alignment: isOwner ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5 - 28,
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(26),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => onChange(UserRole.owner),
                  child: const Text(
                    "Owner",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => onChange(UserRole.it),
                  child: const Text(
                    "IT",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}