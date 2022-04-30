import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../screen/start_screen.dart';
import 'navi.dart';

/// Global
final ring = AudioCache();

Future<void> delay() async {
  Future.delayed(const Duration(milliseconds: 1000));
}

Future<void> play(int n) async {
  final _soundList = [
    //正解：0
    'light_unlock.mp3',

    //ハンター停止：1
    'stop_hunter.mp3',

    //不正解：2
    'in-correct.mp3',

    //ミッション失敗：３
    'failure.mp3',

    //ハンター起動：４
    'start_hunter.mp3',
  ];
  ring.play(_soundList[n]);
}

void enterAudio(bool isSuccess) async {
  int num = isSuccess ? 1 : 3;
  await delay();
  play(num);
}

class Init {
  static void action(BuildContext context, bool isSuccess) async {
    enterAudio(isSuccess);
    await Future.delayed(const Duration(seconds: 60));
    Navi.fadeNavi(context, const StartScreen());
    await Future.delayed(const Duration(seconds: 1));
    play(4);
  }
}
