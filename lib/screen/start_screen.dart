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
    fontSize: 52,
    fontWeight: FontWeight.w600,
    color: Colors.yellowAccent,
  );
  Scaffold buildPage(int nextPage, Widget body) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 60),
            child: const Text(
              '前へ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Colors.white,
            onPressed: () {
              _controller.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
          MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 60),
            child: const Text(
              '次へ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Colors.white,
            onPressed: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
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
                  width: 240,
                ),
                const SizedBox(height: 48),
                Text(
                  'ハンターの動きを止めて、\n'
                  '宝箱にある逮捕状をゲットしよう！！',
                  style: _style,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        buildPage(
          2,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 240,
                ),
                const SizedBox(height: 48),
                Text(
                  'LINEの問題から導かれる\n４桁のパスワードを入力すると\nハンターが15秒間停止する',
                  style: _style,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        buildPage(
          3,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 240,
                ),
                const SizedBox(height: 48),
                Text(
                  'この間に宝箱をゲットして、\n'
                  '急いで警察官に届けよう！',
                  style: _style,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 240,
                ),
                const SizedBox(height: 48),
                Text(
                  '宝箱にふれると、\n'
                  'ハンターが目覚めるかもしなない...',
                  style: _style,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
            child: const Text(
              'パスワードを入力',
              style: TextStyle(
                color: Colors.white,
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navi.blackNavi(context, const LockScreen(), 500);
            },
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
