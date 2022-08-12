import 'package:flutter/material.dart';

/// A center left aligned small label with upper cased text.
class InfoLabel extends StatelessWidget {
  final String label;
  const InfoLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
