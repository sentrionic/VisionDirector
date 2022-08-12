import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final bool isSet;
  final String label;
  const IconLabel({
    super.key,
    required this.icon,
    required this.isSet,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSet ? Colors.white : Colors.white24,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(
            color: isSet ? Colors.white : Colors.white24,
          ),
        ),
      ],
    );
  }
}
