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
  final _ring = AudioCache();

  Future<void> play(int n) async {
    final _soundList = [
      'correct.mp3',
      'success.mp3',
      'in-correct.mp3',
      'failure.mp3',
    ];
    _ring.play(_soundList[n]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLock(
      title: const Text('パスワードを入力せよ'),
      confirmTitle: const Text('正しいパスワードを入力せよ'),
      correctString: '5308',
      canCancel: false,
      didUnlocked: () async {
        await play(0);
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
        play(1);
      },
      didError: (n) async {
        await play(2);
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text('不正解'),
              );
            });
        await Future.delayed(const Duration(milliseconds: 1111));
        play(3);
      },
    );
  }
}
