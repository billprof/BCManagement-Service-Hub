import 'package:flutter/material.dart';
import 'package:test_project/core/utils.dart';

class ActionButton extends StatelessWidget {
  final String label;
  const ActionButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Utils().comingSoonMsg(),
      child: Container(
        padding: EdgeInsets.all(2),

        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.green.shade700),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Text(label, style: TextStyle(fontSize: 12)),
            Icon(Icons.keyboard_arrow_down_rounded, size: 16),
          ],
        ),
      ),
    );
  }
}
