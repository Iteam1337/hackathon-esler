import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool disabled;

  NextButton({
    this.onPressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: new IconButton(
        onPressed: onPressed,
        iconSize: 50.0,
        icon: new Icon(
          Icons.skip_next,
          color: disabled ? Colors.black12 : Colors.grey[200],
        ),
      ),
    );
  }
}
