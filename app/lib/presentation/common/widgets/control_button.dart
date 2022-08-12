import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final Function onClick;
  final IconData icon;
  const ControlButton({
    super.key,
    required this.onClick,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black38,
        ),
        child: Center(
          child: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
