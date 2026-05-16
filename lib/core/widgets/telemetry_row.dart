import 'package:flutter/material.dart';
import 'status_badge.dart';

class TelemetryRow extends StatelessWidget {
  final String label;
  final TelemetryStatus status;
  final VoidCallback onTap;

  const TelemetryRow({
    super.key,
    required this.label,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          const Spacer(),
          StatusBadge(status: status),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onTap,
            child: const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }
}
