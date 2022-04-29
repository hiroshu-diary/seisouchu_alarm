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
  Scaffold buildPage(int nextPage, Widget body) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: body,
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
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
              Icon(
                CupertinoIcons.arrow_down,
                color: Colors.white,
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
          1,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 600,
                ),
                Container(
                  height: 50,
                ),
                Text(
                  'ハンターから逮捕状を奪え！',
                  style: _style,
                )
              ],
            ),
          ),
        ),
        buildPage(
          2,
          Center(
            child: Text(
              'この奥の宝箱に逮捕状がある。\n\n\nしかし、\nハンターがこれを護衛している。',
              style: _style,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        buildPage(
          3,
          Center(
            child: Text(
              'ハンターの護衛を避けるには、\nパスワードを打ち込まなければ\nならない...',
              style: _style,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onTap: () {
              Navi.blackNavi(context, const LockScreen(), 500);
            },
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 4.0,
                    color: Colors.yellowAccent,
                  ),
                ),
                child: Text(
                  'パスワードを打込む',
                  style: _style,
                ),
              ),
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
