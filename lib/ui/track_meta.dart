import 'package:esler/models/track.dart';
import 'package:flutter/material.dart';

class TrackMeta extends StatefulWidget {
  final Track track;

  TrackMeta({Key key, this.track}) : super(key: key);

  @override
  TrackMetaState createState() {
    return TrackMetaState();
  }
}

class TrackMetaState extends State<TrackMeta>
    with SingleTickerProviderStateMixin {
  Animation<EdgeInsets> padding;
  Animation<double> _textAnimation;
  AnimationController _textAnimationController;

  @override
  initState() {
    super.initState();

    _textAnimationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _textAnimation = CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.linear,
    );

    padding = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(left: 30.0),
      end: const EdgeInsets.only(left: 0.0),
    )
        .animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _textAnimationController.addListener(() => this.setState(() => {}));
    _textAnimationController.forward();
  }

  @override
  void didUpdateWidget(TrackMeta oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.track.trackName != widget.track.trackName) {
      this.setState(() {
        _textAnimationController.reset();
        _textAnimationController.forward();
      });
    }
  }

  @override
  dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: padding.value,
      child: FadeTransition(
        opacity: _textAnimation,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                widget.track.artist,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              widget.track.trackName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: AnimatedBuilder(
        animation: _textAnimationController,
        builder: _buildAnimation,
      ),
    );
  }
}
