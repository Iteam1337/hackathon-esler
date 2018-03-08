import 'package:esler/models/playlist.dart';
import 'package:esler/ui/album_cover.dart';
import 'package:esler/ui/track_controls.dart';
import 'package:esler/ui/track_meta.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isPlaying = false;
  Playlist playlist = Playlist();

  void handlePlay() {
    this.setState(() {
      isPlaying = !isPlaying;
    });
  }

  void startPlaying() {
    if (!isPlaying) {
      isPlaying = true;
    }
  }

  void handlePrevious() {
    this.setState(() {
      playlist.previousTrack();
      startPlaying();
    });
  }

  void handleNext() {
    this.setState(() {
      playlist.nextTrack();
      startPlaying();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple[200], Colors.purple[400]],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 275.0,
              width: 275.0,
              child: AlbumCover(
                playlist.currentTrack.coverUrl,
                nextTrack: handleNext,
                previousTrack: handlePrevious,
                hasNext: playlist.hasNext,
                hasPrevious: playlist.hasPrevious,
              ),
            ),
            TrackMeta(track: playlist.currentTrack),
            TrackControls(
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
