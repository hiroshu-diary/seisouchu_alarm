import 'dart:async';

import 'package:flutter/material.dart';

import '../helper/sound.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  int _counter = 15;
  @override
  void initState() {
    super.initState();
    Init.action(context);
    Timer.periodic(
      // 第一引数：繰り返す間隔の時間を設定
      const Duration(seconds: 1),
      // 第二引数：その間隔ごとに動作させたい処理を書く
      (Timer timer) {
        _counter--;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'パスワード解除成功！',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.yellowAccent,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              '宝箱をゲットして、\n急いで警察官に届けよう！',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 100),
            const Text(
              'ハンター再起動まで、あと',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onLongPress: () {
                play(3);
              },
              child: Text(
                '$_counter 秒',
                style: TextStyle(
                  fontSize: _counter > 9 ? 172 : 200,
                  fontWeight: FontWeight.bold,
                  color: _counter > 9 ? Colors.blueAccent : Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
