import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:seisouchu_alarm/screen/success_screen.dart';

import '../helper/navi.dart';
import '../helper/sound.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  static const String _correctString = '2050';
  static const String _title = 'パスワードを入力せよ！';
  static const TextStyle _titleStyle = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    color: Colors.yellowAccent,
  );

  @override
  Widget build(BuildContext context) {
    return ScreenLock(
      canCancel: true,
      // maxRetries: _tryNum,
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
        print(n);
        showDialog(
          context: context,
          builder: (context) {
            String hintText = '';
            if (n == 1) {
              hintText = 'パスワード解除失敗！\n左の図の順に、右の図をなぞってみよう';
            } else if (n == 2) {
              hintText = 'パスワード解除失敗！\n\nヒント１：\nはじめの数字は\n『２』';
            } else if (n == 3) {
              hintText = 'パスワード解除失敗！\n\nヒント２：\nはじめの２桁は\n『２０』';
            } else {
              hintText = 'パスワード解除失敗！\n\nスーパーヒント：\nはじめの3桁は\n『２０５』';
            }
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              insetPadding: const EdgeInsets.all(24.0),
              title: Text(
                hintText,
                textAlign: TextAlign.center,
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
      },
    );
  }
}
