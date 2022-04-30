import 'package:flutter/material.dart';
import 'package:seisouchu_alarm/screen/reset_screen.dart';

import '../helper/navi.dart';
import '../helper/sound.dart';

class FailureScreen extends StatefulWidget {
  const FailureScreen({Key? key}) : super(key: key);

  @override
  State<FailureScreen> createState() => _FailureScreenState();
}

class _FailureScreenState extends State<FailureScreen> {
  @override
  void initState() {
    super.initState();
    Init.action(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          'ハンター警戒モード・ON',
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
