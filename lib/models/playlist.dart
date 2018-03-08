import 'package:esler/models/track.dart';

class Playlist {
  final List<Track> _queue = [
    Track(
      artist: 'Pharrell Williams',
      trackName: 'Happy',
      coverUrl:
          'http://resources.mynewsdesk.com/image/upload/c_limit,dpr_1.0,f_auto,h_700,q_auto,w_690/hamadejuo74rnacmnfby.jpg',
    ),
    Track(
      artist: 'Skrillex and Diplo present Jack Ü',
      trackName: 'Where Are Ü Now (with Justin Bieber)',
      coverUrl:
          'https://static.stereogum.com/uploads/2015/02/jacku-640x640.jpg',
    ),
    Track(
      artist: '3OH!3',
      trackName: 'Back to Life',
      coverUrl:
          'https://images-na.ssl-images-amazon.com/images/I/61jSKTBA7YL.jpg',
    ),
    Track(
      artist: 'MiTiS (feat. Anna Yvette)',
      trackName: 'Open Window',
      coverUrl:
          'https://images.shazam.com/coverart/t90705537-b656614755_s400.jpg',
    ),
    Track(
      artist: 'Kasger',
      trackName: 'Rapid',
      coverUrl:
          'https://i1.sndcdn.com/artworks-000122422350-un6n42-t500x500.jpg',
    ),
  ];

  int currentIndex = 0;

  Playlist() {
    _queue.shuffle();
  }

  /// Queue
  List<Track> get queue => _queue;
  Track get currentTrack => _queue[currentIndex];

  /// Playlist controls
  bool get hasNext => currentIndex < _queue.length - 1;
  bool get hasPrevious => currentIndex > 0;

  void nextTrack() {
    if (currentIndex == _queue.length - 1) {
      return;
    }

    currentIndex++;
  }

  void previousTrack() {
    if (currentIndex == 0) {
      return;
    }

    currentIndex--;
  }
}
