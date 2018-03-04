import 'package:esler/models/playlist.dart';
import 'package:test/test.dart';

void main() {
  Playlist playlist;

  setUp(() {
    playlist = new Playlist();
  });

  test('gets playlist queue', () {
    expect(playlist.queue.length, 5);
  });

  group('#hasNext', () {
    test('returns true if next button is enabled', () {
      expect(playlist.hasNext, true);
    });

    test('returns false if next button is disabled', () {
      playlist.currentIndex = 4;

      expect(playlist.hasNext, false);
    });
  });

  group('#hasPrevious', () {
    test('gets has previous state', () {
      expect(playlist.hasPrevious, false);
    });

    test('returns false if next button is disabled', () {
      playlist.currentIndex = 1;

      expect(playlist.hasPrevious, true);
    });
  });

  group('#nextTrack', () {
    test('increments current index', () {
      playlist.nextTrack();

      expect(playlist.currentIndex, 1);
    });

    test('does not increment above queue length', () {
      playlist.currentIndex = 4;
      playlist.nextTrack();

      expect(playlist.currentIndex, 4);
    });
  });

  group('#previousTrack', () {
    test('decrements current index', () {
      playlist.currentIndex = 2;
      playlist.previousTrack();

      expect(playlist.currentIndex, 1);
    });

    test('does not decrement below zero', () {
      playlist.previousTrack();

      expect(playlist.currentIndex, 0);
    });
  });
}
