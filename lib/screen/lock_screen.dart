import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:seisouchu_alarm/screen/failure_screen.dart';
import 'package:seisouchu_alarm/screen/success_screen.dart';

import '../helper/sound.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLock(
      title: const Text('パスワードを入力せよ'),
      confirmTitle: const Text('正しいパスワードを入力せよ'),
      correctString: '5308',
      canCancel: false,
      didUnlocked: () async {
        await play(0);
        await Future.delayed(const Duration(milliseconds: 1200));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const SuccessScreen();
            },
          ),
        );
      },
      didError: (n) async {
        await play(2);
        await Future.delayed(const Duration(milliseconds: 1200));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const FailureScreen();
            },
          ),
        );
      },
    );
  }
}
