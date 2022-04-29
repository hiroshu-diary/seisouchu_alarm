import 'package:flutter/material.dart';
import 'package:seisouchu_alarm/screen/start_screen.dart';

import '../helper/navi.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => Navi.fadeNavi(context, const StartScreen()),
      child: const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            '長押しで戻る',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
