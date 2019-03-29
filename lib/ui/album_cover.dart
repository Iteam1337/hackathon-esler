import 'package:flutter/material.dart';

class AlbumCover extends StatefulWidget {
  final String coverUrl;
  final VoidCallback nextTrack;
  final VoidCallback previousTrack;
  final bool hasNext;
  final bool hasPrevious;

  AlbumCover(
    this.coverUrl, {
    Key key,
    this.nextTrack,
    this.previousTrack,
    this.hasNext,
    this.hasPrevious,
  }) : super(key: key);

  @override
  AlbumCoverState createState() {
    return new AlbumCoverState();
  }
}

class AlbumCoverState extends State<AlbumCover>
    with SingleTickerProviderStateMixin {
  Animation<double> _fadeAnimation;
  AnimationController _fadeAnimationController;

  @override
  initState() {
    super.initState();

    _fadeAnimationController = new AnimationController(
      duration: new Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation = new CurvedAnimation(
      parent: _fadeAnimationController,
      curve: Curves.easeIn,
    );

    _fadeAnimationController.addListener(() => this.setState(() => {}));
    _fadeAnimationController.forward();
  }

  @override
  void didUpdateWidget(AlbumCover oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.coverUrl != widget.coverUrl) {
      _fadeAnimationController.reset();
      _fadeAnimationController.forward();
    }
  }

  @override
  dispose() {
    _fadeAnimationController.dispose();
    super.dispose();
  }

  void _handleDismiss(DismissDirection direction) {
    if (direction == DismissDirection.startToEnd && widget.hasPrevious) {
      widget.previousTrack();
    }

    if (direction == DismissDirection.endToStart && widget.hasNext) {
      widget.nextTrack();
    }
  }

  DismissDirection _handleDismissDirection() {
    if (!widget.hasNext) {
      return DismissDirection.startToEnd;
    }

    if (!widget.hasPrevious) {
      return DismissDirection.endToStart;
    }

    return DismissDirection.horizontal;
  }

  @override
  Widget build(BuildContext context) {
    return new FadeTransition(
      opacity: _fadeAnimation,
      child: new Dismissible(
        direction: _handleDismissDirection(),
        resizeDuration: null,
        key: new ObjectKey(widget.coverUrl),
        onDismissed: _handleDismiss,
        child: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new NetworkImage(
                widget.coverUrl,
              ),
            ),
            borderRadius: new BorderRadius.circular(8.0),
            boxShadow: [
              new BoxShadow(
                color: Colors.black45,
                blurRadius: 15.0,
                offset: new Offset(0.0, 20.0),
                spreadRadius: -10.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
