import 'package:flutter/material.dart';
import 'package:grad/core/app_colors.dart';
import 'package:grad/screens/login.dart';

class ManagerHomeScreen extends StatelessWidget {
  const ManagerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "WELCOME MANAGER",
          style: TextStyle(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.textSecondary),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          )
        ],
      ),

      body: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "EXECUTIVE SUMMARY",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 3.2,
                  children: [
                    _smallCard("FIREWALL BLOCKS"),
                    _smallCard("SECURITY ALERTS"),
                    _smallCard("SYSTEM UPDATES"),
                    _smallCard("USER ACTIVITY"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "LATEST INCIDENTS",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      height: 220,
                      child: ListView(
                        children: [
                          _incidentRow("Unauthorized Login", "Multiple failed attempts", "2 min ago", Colors.red),
                          _divider(),
                          _incidentRow("Firewall Updated", "New rules applied", "10 min ago", Colors.green),
                          _divider(),
                          _incidentRow("Malware Detected", "Quarantined successfully", "30 min ago", Colors.blue),
                          _divider(),
                          _incidentRow("User Access Changed", "Permissions updated", "1 hr ago", Colors.green),
                          _divider(),
                          _incidentRow("System Scan", "Completed successfully", "2 hr ago", Colors.blue),
                          _incidentRow("Unauthorized Login", "Multiple failed attempts", "2 min ago", Colors.red),
                          _divider(),
                          _incidentRow("Firewall Updated", "New rules applied", "10 min ago", Colors.green),
                          _divider(),
                          _incidentRow("Malware Detected", "Quarantined successfully", "30 min ago", Colors.blue),
                          _divider(),
                          _incidentRow("User Access Changed", "Permissions updated", "1 hr ago", Colors.green),
                          _divider(),
                          _incidentRow("System Scan", "Completed successfully", "2 hr ago", Colors.blue),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "MANAGER ACCESS IS VIEW-ONLY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _smallCard(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  Widget _incidentRow(String title, String desc, String time, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  desc,
                  style: TextStyle(
                    color: AppColors.textSecondary.withOpacity(0.6),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          Text(
            time,
            style: TextStyle(
              color: AppColors.textSecondary.withOpacity(0.6),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(
      color: AppColors.secondaryBackground,
      height: 1,
    );
  }
}