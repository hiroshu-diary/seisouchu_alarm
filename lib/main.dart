import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return ScreenLock(
      title: const Text('パスワードを入力せよ'),
      confirmTitle: const Text('正しいパスワードを入力せよ'),
      correctString: '1111',
      canCancel: false,
      didUnlocked: () async {
        //todo await 正解の効果音
        await _player.play('correct.mp3');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('正解画面'),
              ),
            );
          }),
        );
        await Future.delayed(const Duration(milliseconds: 1111));
        _player.play('church.mp3');
      },
      didError: (num) async {
        print(num);
        await _player.play('non-correct.mp3');
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text('不正解'),
              );
            });
        await Future.delayed(const Duration(seconds: 1));
        _player.play('attention.mp3');
        //todo await 不正解の効果音
        //todo ダイアログ表示
      },
    );
  }
}
