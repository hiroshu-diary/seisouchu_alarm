import 'package:flutter/material.dart';

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
      body: Center(
        child: Image.asset('assets/ff.png', width: 640),
      ),
    );
  }
}
