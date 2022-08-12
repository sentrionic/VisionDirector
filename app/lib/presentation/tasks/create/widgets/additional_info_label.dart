import 'package:flutter/material.dart';

class AdditionalInfoLabel extends StatelessWidget {
  const AdditionalInfoLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Additional Optional Information".toUpperCase(),
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
