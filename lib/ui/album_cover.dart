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
  })
      : super(key: key);

  @override
  AlbumCoverState createState() {
    return AlbumCoverState();
  }
}

class AlbumCoverState extends State<AlbumCover>
    with SingleTickerProviderStateMixin {
  Animation<double> _fadeAnimation;
  AnimationController _fadeAnimationController;

  @override
  initState() {
    super.initState();

    _fadeAnimationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
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

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dismissible(
        resizeDuration: null,
        key: ObjectKey(widget.coverUrl),
        onDismissed: _handleDismiss,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.coverUrl,
              ),
            ),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 15.0,
                offset: Offset(0.0, 20.0),
                spreadRadius: -10.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
