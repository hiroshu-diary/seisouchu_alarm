import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class Audio {
  late final AudioCache player;
  final _correct = 'correct.mp3';
  final _inCorrect = 'in-correct.mp3';
  final _success = 'success.mp3';
  final _failure = 'failure.mp3';
  Future correct() async {
    await player.play(_correct);
  }

  Future<void> inCorrect() async {
    await player.play(_inCorrect);
  }

  Future<void> success() async {
    await player.play(_success);
  }

  Future<void> failure() async {
    await player.play(_failure);
  }

  Audio({required this.player});
}
