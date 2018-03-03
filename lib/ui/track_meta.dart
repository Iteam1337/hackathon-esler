import 'package:esler/models/track.dart';
import 'package:flutter/material.dart';

class TrackMeta extends StatefulWidget {
  final Track track;

  TrackMeta({Key key, this.track}) : super(key: key);

  @override
  TrackMetaState createState() {
    return new TrackMetaState();
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

    _textAnimationController = new AnimationController(
      duration: new Duration(milliseconds: 300),
      vsync: this,
    );

    _textAnimation = new CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.linear,
    );

    padding = new Tween<EdgeInsets>(
      begin: const EdgeInsets.only(left: 30.0),
      end: const EdgeInsets.only(left: 0.0),
    ).animate(
      new CurvedAnimation(
        parent: _textAnimationController,
        curve: new Interval(
          0.0,
          1.0,
          curve: Curves.ease,
        ),
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
    return new Padding(
      padding: padding.value,
      child: new Column(
        children: <Widget>[
          new FadeTransition(
            opacity: _textAnimation,
            child: new Text(
              widget.track.artist,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 21.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          new Container(height: 6.0),
          new FadeTransition(
            opacity: _textAnimation,
            child: new Text(
              widget.track.trackName,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: new AnimatedBuilder(
        animation: _textAnimationController,
        builder: _buildAnimation,
      ),
    );
  }
}
