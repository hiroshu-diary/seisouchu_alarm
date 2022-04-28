import 'package:audioplayers/audioplayers.dart';

/// Global
final ring = AudioCache();

Future<void> play(int n) async {
  final _soundList = [
    'correct.mp3',
    'success.mp3',
    'in-correct.mp3',
    'failure.mp3',
  ];
  ring.play(_soundList[n]);
}
