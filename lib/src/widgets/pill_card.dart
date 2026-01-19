import 'package:flutter/material.dart';
import '../models/pill_model.dart';

class PillCard extends StatelessWidget {
  final PillModel pill;
  final VoidCallback onTap;

  const PillCard({super.key, required this.pill, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: const Icon(Icons.medication, color: Color(0xFF0052D4)),
        title: Text(pill.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(pill.effect, maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}