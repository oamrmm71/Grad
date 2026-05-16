import 'package:flutter/material.dart';

enum TelemetryStatus { healthy, degraded, critical }

class StatusBadge extends StatelessWidget {
  final TelemetryStatus status;
  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, bg, fg) = switch (status) {
      TelemetryStatus.healthy  => ("Healthy",  const Color(0xFF1B4332), Colors.greenAccent),
      TelemetryStatus.degraded => ("Degraded", const Color(0xFF4A2C00), const Color(0xFFFFA726)),
      TelemetryStatus.critical => ("Critical", const Color(0xFF4A0000), Colors.redAccent),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: fg, width: 1.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: fg, fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}
