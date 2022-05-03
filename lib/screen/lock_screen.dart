import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:seisouchu_alarm/screen/failure_screen.dart';
import 'package:seisouchu_alarm/screen/success_screen.dart';

import '../helper/navi.dart';
import '../helper/sound.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  static const int _tryNum = 3;
  static const String _correctString = '2050';
  static const String _title = 'パスワードを入力せよ！';
  static const TextStyle _titleStyle = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return ScreenLock(
      canCancel: true,
      maxRetries: _tryNum,
      correctString: _correctString,
      title: const Text(_title, style: _titleStyle),
      confirmTitle: const Text(_title, style: _titleStyle),
      secretsConfig: const SecretsConfig(
        spacing: 60,
        padding: EdgeInsets.all(60),
        secretConfig: SecretConfig(
          width: 24,
          height: 24,
        ),
      ),
      inputButtonConfig: const InputButtonConfig(
        height: 140,
        width: 140,
        textStyle: TextStyle(fontSize: 48),
      ),
      didUnlocked: () async {
        await play(0);
        await Future.delayed(const Duration(milliseconds: 1000));
        Navi.navigate360(context, const Offset(0.5, 0), const SuccessScreen());
      },
      didError: (n) {
        if (n < _tryNum) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                insetPadding: const EdgeInsets.all(24.0),
                title: Text(
                  '入力できるのは、あと${3 - n}回',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
          play(2);
        }
      },
      didMaxRetries: (n) async {
        await play(2);
        await Future.delayed(const Duration(milliseconds: 1300));
        Navi.navigate360(context, const Offset(-1, 0), const FailureScreen());
      },
    );
  }
}
