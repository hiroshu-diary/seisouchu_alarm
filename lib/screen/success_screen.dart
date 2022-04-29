import 'package:flutter/material.dart';
import 'package:seisouchu_alarm/helper/sound.dart';
import 'package:seisouchu_alarm/screen/reset_screen.dart';

import '../helper/navi.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    enterAudio(true);
    return Scaffold(
      body: const Center(
        child: Text('ミッション成功！'),
      ),
      floatingActionButton: TextButton(
        child: const Text('   \n　　\n　　'),
        onPressed: () {},
        onLongPress: () {
          Navi.fadeNavi(context, const ResetScreen());
        },
      ),
    );
  }
}
