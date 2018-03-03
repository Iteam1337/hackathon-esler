import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool disabled;

  PreviousButton({
    this.onPressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: new IconButton(
        onPressed: onPressed,
        iconSize: 50.0,
        icon: new Icon(
          Icons.skip_previous,
          color: disabled ? Colors.black12 : Colors.grey[200],
        ),
      ),
    );
  }
}
