import 'package:esler/models/playlist.dart';
import 'package:esler/ui/album_cover.dart';
import 'package:esler/ui/track_controls.dart';
import 'package:esler/ui/track_meta.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => new _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isPlaying = false;
  Playlist playlist = new Playlist();

  void handlePlay() {
    this.setState(() {
      isPlaying = !isPlaying;
    });
  }

  void handlePrevious() {
    this.setState(() {
      playlist.previousTrack();
    });
  }

  void handleNext() {
    this.setState(() {
      playlist.nextTrack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Colors.purple[200],
              Colors.purple[400],
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
          ),
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new AlbumCover(playlist.currentTrack.coverUrl),
            new TrackMeta(track: playlist.currentTrack),
            new TrackControls(
              handleNext: handleNext,
              handlePlay: handlePlay,
              handlePrevious: handlePrevious,
              hasNext: playlist.hasNext,
              hasPrevious: playlist.hasPrevious,
              isPlaying: isPlaying,
            ),
          ],
        ),
      ),
    );
  }
}
