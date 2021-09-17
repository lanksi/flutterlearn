import 'package:flutter/cupertino.dart';

class AnimatedCounter extends StatelessWidget {
  final int value;
  final Duration duration;

  AnimatedCounter({required this.duration, required this.value});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween(end: value.toDouble()),
      builder: (context, double value, child) {
        final whole = value ~/ 1;
        final decimal = value - whole;
        return Stack(
          children: [
            Positioned(
                top: -100 * decimal,
                child: Opacity(
                  opacity: 1.0 - decimal, //1-0
                  child: Text(
                    "$whole",
                    style: TextStyle(fontSize: 100),
                  ),
                )),
            Positioned(
                top: 100 - decimal * 100,
                child: Opacity(
                  opacity: decimal,
                  child: Text(
                    "${whole + 1}",
                    style: TextStyle(fontSize: 100),
                  ),
                ))
          ],
        );
      },
    );
  }
}
