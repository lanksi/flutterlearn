import 'dart:math';

import 'package:flutter/material.dart';

class demo7 extends StatefulWidget {
  @override
  createState() => _demo7();
}

class _demo7 extends State<demo7> with SingleTickerProviderStateMixin {
  int _counter = 0;

  late AnimationController _controller;
  List<Snowflake> _snowflakes = List.generate(100, (index) => Snowflake());

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo7'),
      ),
      body: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue, Colors.lightBlue, Colors.white],
                      stops: [0.0, 0.5, 1.0])),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  _snowflakes.forEach((snow) => snow.fall());
                  return CustomPaint(
                    painter: MyPainter(_snowflakes),
                  );
                },
                child: CustomPaint(
                  painter: MyPainter(_snowflakes),
                ),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyPainter extends CustomPainter {
  late List<Snowflake> _snowflakes;

  MyPainter(this._snowflakes);

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    final whitePaint = Paint()..color = Colors.white;
    canvas.drawCircle(size.center(Offset(0, 60)), 60, whitePaint);
    canvas.drawOval(
        Rect.fromCenter(
            center: size.center(Offset(0, 230)), width: 200, height: 250),
        whitePaint);
    _snowflakes.forEach((snowflake) {
      canvas.drawCircle(
          Offset(snowflake.x, snowflake.y), snowflake.radius, whitePaint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Snowflake {
  double x = Random().nextDouble() * 400;
  double y = Random().nextDouble() * 800;
  double radius = Random().nextDouble() * 2 + 2;
  double velocity = Random().nextDouble() * 4 + 2;

  fall() {
    y += velocity;
    if (y > 800) {
      y = 0;
      x = Random().nextDouble() * 400;
      radius = Random().nextDouble() * 2 + 2;
      velocity = Random().nextDouble() * 4 + 2;
    }
  }
}
