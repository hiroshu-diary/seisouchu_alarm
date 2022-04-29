import 'package:audioplayers/audioplayers.dart';

/// Global
final ring = AudioCache();

Future<void> delay() async {
  Future.delayed(const Duration(milliseconds: 1000));
}

Future<void> play(int n) async {
  final _soundList = [
    //正解：0
    'light_unlock.mp3',

    //ミッション成功：1
    'stop_hunter.mp3',

    //不正解：2
    'in-correct.mp3',

    //ミッション失敗：3
    'failure.mp3',
  ];
  ring.play(_soundList[n]);
}

void enterAudio(bool isSuccess) async {
  int num = isSuccess ? 1 : 3;
  await delay();
  play(num);
}
