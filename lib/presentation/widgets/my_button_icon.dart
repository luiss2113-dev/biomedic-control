import 'package:flutter/material.dart';

class MyButtonIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final bool isSelected;
  const MyButtonIcon({
    super.key,
    required this.icon,
    this.size = 24,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 5 : 0,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Icon(
          icon,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          size: size,
        ),
      ),
    );
  }
}
