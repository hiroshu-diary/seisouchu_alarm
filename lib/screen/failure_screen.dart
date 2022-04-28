import 'package:flutter/material.dart';
import 'package:seisouchu_alarm/helper/sound.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    enterAudio(false);
    return const Scaffold(
      body: Center(
        child: Text('ミッション失敗...'),
      ),
    );
  }
}
