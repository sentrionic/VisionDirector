import 'package:flutter/material.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

/// A [ListTile] wrapped inside a [Card] used for Bottomsheets.
class ModalButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onClick;
  const ModalButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeColors.appBackground,
      elevation: 0,
      child: ListTile(
        onTap: () => onClick(),
        title: Text(label),
        leading: Icon(icon),
      ),
    );
  }
}

/// A [ListTile] wrapped inside a [Card] used for Bottomsheets. Displays the [color].
class ModalAssetButton extends StatelessWidget {
  final String label;
  final Color color;
  final Function onClick;
  const ModalAssetButton({
    super.key,
    required this.label,
    required this.color,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeColors.appBackground,
      elevation: 0,
      child: ListTile(
        onTap: () => onClick(),
        title: Text(label),
        leading: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
        ),
      ),
    );
  }
}
