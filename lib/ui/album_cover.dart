import 'package:flutter/material.dart';

class AlbumCover extends StatelessWidget {
  final String coverUrl;

  AlbumCover(this.coverUrl);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 275.0,
      width: 275.0,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage(
            coverUrl,
          ),
        ),
        borderRadius: new BorderRadius.circular(5.0),
        boxShadow: [
          new BoxShadow(
            color: Colors.black45,
            blurRadius: 15.0,
            offset: new Offset(0.0, 20.0),
            spreadRadius: -10.0,
          )
        ],
      ),
    );
  }
}
