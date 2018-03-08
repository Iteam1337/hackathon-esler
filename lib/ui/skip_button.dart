import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool disabled;
  final IconData icon;

  SkipButton(
    this.icon, {
    @required this.onPressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 50.0,
      icon: Icon(
        icon,
        color: disabled ? Colors.black12 : Colors.grey[200],
      ),
    );
  }
}
