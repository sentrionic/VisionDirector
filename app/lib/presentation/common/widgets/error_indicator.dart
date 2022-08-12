import 'package:flutter/material.dart';

/// Displays a simple error message.
class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Something went wrong"),
    );
  }
}
