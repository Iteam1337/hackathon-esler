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
    return new IconButton(
      onPressed: onPressed,
      iconSize: 50.0,
      icon: new Icon(
        icon,
        color: disabled ? Colors.black12 : Colors.grey[200],
      ),
    );
  }
}
