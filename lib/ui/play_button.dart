import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPressed;

  PlayButton(this.isPlaying, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: <Color>[Colors.white, Colors.grey[200]],
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            spreadRadius: 10.0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10.0),
      child: IconButton(
        onPressed: onPressed,
        iconSize: 40.0,
        icon: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
