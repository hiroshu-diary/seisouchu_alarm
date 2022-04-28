import 'package:flutter/material.dart';

class Navi {
  ///方向指定可能、ただしpushReplacement
  static Future<dynamic> navigate(
    BuildContext context,
    Widget returnContext,
    Offset beginOffset,
  ) {
    return Navigator.of(context).pushReplacement(
      PageRouteBuilder(pageBuilder: (
        BuildContext? context,
        Animation? animation,
        Animation? secondaryAnimation,
      ) {
        return returnContext;
      }, transitionsBuilder: (
        BuildContext context,
        Animation<double>? animation,
        Animation? secondaryAnimation,
        Widget? child,
      ) {
        return SlideTransition(
          position: Tween(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(animation!),
          child: child,
        );
      }),
    );
  }

  ///Dialog用のNavigator
  static Future<dynamic> popUntil(
    BuildContext context,
    Widget returnContext,
    Offset beginOffset,
  ) {
    return Navigator.of(context).pushReplacement(
      PageRouteBuilder(pageBuilder: (
        BuildContext? context,
        Animation? animation,
        Animation? secondaryAnimation,
      ) {
        return returnContext;
      }, transitionsBuilder: (
        BuildContext context,
        Animation<double>? animation,
        Animation? secondaryAnimation,
        Widget? child,
      ) {
        return SlideTransition(
          position: Tween(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(animation!),
          child: child,
        );
      }),
    );
  }

  ///全方向移動のNavigator.push
  static void navigate360(BuildContext context, Offset offset, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return page;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final Offset begin = offset; // 下から上
          const Offset end = Offset.zero;
          final Animatable<Offset> tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: Curves.easeInOut));
          final Animation<Offset> offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  ///ホワイトアウトorブラックアウト
  static void blackNavi(
    BuildContext context,
    Widget page,
    int length,
  ) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return page;
        },
        transitionDuration: Duration(milliseconds: length),
        reverseTransitionDuration: Duration(milliseconds: length),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final color = ColorTween(
            begin: Colors.transparent,
            end: Colors.black, // ブラックアウト
            // end: Colors.white, // ホワイトアウト
          ).animate(CurvedAnimation(
            parent: animation,
            // 前半
            curve: const Interval(
              0.0,
              0.5,
              curve: Curves.easeInOut,
            ),
          ));
          final opacity = Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            // 後半
            curve: const Interval(
              0.5,
              1.0,
              curve: Curves.easeInOut,
            ),
          ));
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Container(
                color: color.value,
                child: Opacity(
                  opacity: opacity.value,
                  child: child,
                ),
              );
            },
            child: child,
          );
        },
      ),
    );
  }

  ///フェード
  static void fadeNavi(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return page;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const double begin = 0.0;
          const double end = 1.0;
          final Animatable<double> tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: Curves.easeInOut));
          final Animation<double> doubleAnimation = animation.drive(tween);
          return FadeTransition(
            opacity: doubleAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
