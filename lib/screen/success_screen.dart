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
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          '60秒間だけ、\nハンターが機能を停止する。'
          '\nこの時間に逮捕状をゲットせよ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 40,
          ),
        ),
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
