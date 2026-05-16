import 'package:flutter/material.dart';
import 'package:grad/core/app_colors.dart';
import 'package:grad/screens/login.dart';
import 'package:grad/core/widgets/card_container.dart';
import 'package:grad/core/widgets/incident_row.dart';
import 'package:grad/core/widgets/kip_chip.dart';

class ManagerHomeScreen extends StatelessWidget {
  const ManagerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "A-MSSP • Manager",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Page title ─────────────────────────────────────────
            const Text(
              "Executive Summary",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // ── Overview KPI card ──────────────────────────────────
            CardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Overview",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 2.8,
                    children: const [
                      KpiChip(label: "Firewall Blocks", color: Colors.redAccent),
                      KpiChip(label: "Security Alerts", color: Color(0xFFFFA726)),
                      KpiChip(label: "System Updates",  color: Colors.blueAccent),
                      KpiChip(label: "User Activity",   color: Colors.greenAccent),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Latest Incidents card (scrollable) ─────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Latest incidents",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 260,
                    child: ListView(
                      children: [
                        IncidentRow(dotColor: Colors.redAccent,   title: "Unauthorized Login",   subtitle: "Multiple failed attempts",  time: "2m ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.greenAccent, title: "Firewall Updated",      subtitle: "New rules applied",         time: "10m ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.blueAccent,  title: "Malware Detected",      subtitle: "Quarantined successfully",   time: "30m ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.greenAccent, title: "User Access Changed",   subtitle: "Permissions updated",       time: "1h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.blueAccent,  title: "System Scan",           subtitle: "Completed successfully",    time: "2h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.redAccent,   title: "Unauthorized Login",    subtitle: "Multiple failed attempts",  time: "3h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.greenAccent, title: "Firewall Updated",      subtitle: "New rules applied",         time: "4h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.blueAccent,  title: "Malware Detected",      subtitle: "Quarantined successfully",  time: "5h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.greenAccent, title: "User Access Changed",   subtitle: "Permissions updated",       time: "6h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.blueAccent,  title: "System Scan",           subtitle: "Completed successfully",    time: "7h ago"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── View-only notice card ──────────────────────────────
            CardContainer(
              child: Row(
                children: const [
                  Icon(Icons.lock_outline, color: Colors.white54, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Manager access is view-only",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}