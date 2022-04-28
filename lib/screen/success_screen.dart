import 'package:flutter/material.dart';
import 'package:seisouchu_alarm/helper/sound.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    enterAudio(true);
    return const Scaffold(
      body: Center(
        child: Text('ミッション成功！'),
      ),
    );
  }
}
