import 'package:flutter/material.dart';

class InfoBoxWrapper extends StatelessWidget {
  final List<Widget> children;
  const InfoBoxWrapper({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          ),
        ],
      ),
    );
  }
}
