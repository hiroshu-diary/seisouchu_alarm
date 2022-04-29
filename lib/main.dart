import 'package:flutter/material.dart';
import 'package:seisouchu_alarm/screen/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}

//todo ホーム画面のUI
//todo 画面遷移の調整
//todo 成功画面のUI
//todo 失敗画面のUI
//todo テスト＆調整
//todo 実機テスト
