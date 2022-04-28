import 'package:flutter/material.dart';
import 'package:seisouchu_alarm/helper/navi.dart';
import 'package:seisouchu_alarm/helper/sound.dart';
import 'package:seisouchu_alarm/screen/reset_screen.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    enterAudio(false);
    return Scaffold(
      body: const Center(
        child: Text('ミッション失敗...'),
      ),
      floatingActionButton: TextButton(
        child: const Text('   '),
        onPressed: () {},
        onLongPress: () {
          Navi.fadeNavi(context, const ResetScreen());
        },
      ),
    );
  }
}
