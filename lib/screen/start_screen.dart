import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/navi.dart';
import 'lock_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _controller = PageController(
    initialPage: 0,
  );
  final _style = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: Colors.yellowAccent,
  );
  Scaffold buildPage(String text, int nextPage) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text, style: _style),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                '次へ\n',
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 36,
                ),
              ),
              Icon(
                CupertinoIcons.arrow_down,
                color: Colors.yellowAccent,
                size: 36,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _pageView = PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: [
        buildPage(
          'ハンターの護衛を避けるには、\nパスワードを打ち込まなければ\nならない。',
          1,
        ),
        buildPage(
          '2',
          2,
        ),
        Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: GestureDetector(
              child: Text(
                'パスワードを打込む',
                style: _style,
              ),
              onTap: () {
                Navi.blackNavi(context, const LockScreen(), 500);
              },
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _pageView,
      ),
    );
  }
}
