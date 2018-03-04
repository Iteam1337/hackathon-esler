import 'package:esler/ui/play_button.dart';
import 'package:esler/ui/skip_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TrackControls extends StatelessWidget {
  final bool isPlaying;
  final bool hasNext;
  final bool hasPrevious;
  final VoidCallback handlePlay;
  final VoidCallback handleNext;
  final VoidCallback handlePrevious;

  TrackControls({
    this.hasNext,
    this.hasPrevious,
    @required this.isPlaying,
    @required this.handlePlay,
    @required this.handleNext,
    @required this.handlePrevious,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new SkipButton(
            Icons.skip_previous,
            disabled: hasPrevious != true,
            onPressed: handlePrevious,
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new PlayButton(
              isPlaying,
              onPressed: handlePlay,
            ),
          ),
          new SkipButton(
            Icons.skip_next,
            disabled: hasNext != true,
            onPressed: handleNext,
          )
        ],
      ),
    );
  }
}
