import 'package:flutter/material.dart';
import 'package:grad/core/app_colors.dart';
import 'package:grad/screens/login.dart';
import 'package:grad/core/widgets/card_container.dart';
import 'package:grad/core/widgets/status_badge.dart';
import 'package:grad/core/widgets/telemetry_row.dart';
import 'package:grad/core/widgets/incident_row.dart';

class ITHomeScreen extends StatelessWidget {
  const ITHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          "                            A-MSSP • IT",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: false,
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
            const Text(
              "SOC Dashboard",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            CardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Telemetry",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  TelemetryRow(
                    label: "Switch",
                    status: TelemetryStatus.healthy,
                    onTap: () => _showNoDeviceDialog(context, "Switch"),
                  ),
                  const Divider(color: Colors.white24),
                  TelemetryRow(
                    label: "Server",
                    status: TelemetryStatus.degraded,
                    onTap: () => _showNoDeviceDialog(context, "Server"),
                  ),
                  const Divider(color: Colors.white24),
                  TelemetryRow(
                    label: "Firewall",
                    status: TelemetryStatus.healthy,
                    onTap: () => _showNoDeviceDialog(context, "Firewall"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            CardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Containment Actions",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => _showNoDeviceDialog(context, "Server"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        "Kill-Switch (isolate network)",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => _showNoDevicesDialog(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2979FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        "Block IP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

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
                  const Text("Latest incidents",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 260,
                    child: ListView(
                      children: [
                        IncidentRow(dotColor: Colors.redAccent,   title: "Suspicious admin login blocked", subtitle: "Critical · DC · Contained",     time: "2m ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.blueAccent,  title: "Multiple failed logins",         subtitle: "Medium · VPN · Resolved",       time: "15m ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.greenAccent, title: "New device joined",              subtitle: "Low · Printer",                  time: "30m ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.redAccent,   title: "Port scan detected",             subtitle: "High · Firewall · Blocked",      time: "45m ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.orangeAccent,title: "Config change on switch",        subtitle: "Medium · Switch · Reviewing",    time: "1h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.blueAccent,  title: "VPN tunnel re-established",      subtitle: "Low · VPN · Resolved",           time: "2h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.redAccent,   title: "Brute force attempt",            subtitle: "Critical · SSH · Blocked",       time: "3h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.greenAccent, title: "Firmware updated",               subtitle: "Low · Router · Completed",       time: "4h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.orangeAccent,title: "Unusual outbound traffic",       subtitle: "High · Server · Investigating",  time: "5h ago"),
                        const Divider(color: Colors.white12),
                        IncidentRow(dotColor: Colors.blueAccent,  title: "Certificate renewed",            subtitle: "Low · Web Server · Completed",   time: "6h ago"),
                      ],
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

  void _showNoDeviceDialog(BuildContext context, String device) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Text("No Connected $device",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17)),
        content: Text("Connect a $device to perform this action",
            style: const TextStyle(color: Colors.grey)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK")),
        ],
      ),
    );
  }

  void _showNoDevicesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.background,
        title: const Text("No Devices",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        content: const Text("There are no devices yet",
            style: TextStyle(color: Colors.grey)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK")),
        ],
      ),
    );
  }
}
