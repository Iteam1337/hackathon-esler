import 'package:esler/models/track.dart';
import 'package:test/test.dart';

void main() {
  test('instantiates a Track', () {
    Track track = new Track(
      artist: 'Test',
      trackName: 'Name',
      coverUrl: 'img.png',
    );

    expect(track.artist, 'Test');
    expect(track.trackName, 'Name');
    expect(track.coverUrl, 'img.png');
  });
}
