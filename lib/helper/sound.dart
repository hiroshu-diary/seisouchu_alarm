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
    //解錠：0
    'light_unlock.mp3',

    //ハンター停止：１
    'stop_hunter.mp3',

    //不正解：２
    'in-correct.mp3',

    //警告；３
    'restart.mp3',

    //ハンター起動：４
    'start_hunter.mp3',
  ];
  ring.play(_soundList[n]);
}

class Init {
  static void action(BuildContext context) async {
    await delay();
    play(1);
    await Future.delayed(const Duration(seconds: 15));
    Navi.fadeNavi(context, const StartScreen());
    await Future.delayed(const Duration(seconds: 1));
    play(4);
  }
}
