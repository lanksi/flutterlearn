import 'package:flutter/material.dart';

class demo6 extends StatefulWidget {
  @override
  createState() => _demo6();
}

class _demo6 extends State<demo6> with TickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _expantioncontroller;
  late AnimationController _opacitycontroller;

  @override
  void initState() {
    // TODO: implement initState
    _expantioncontroller = AnimationController(vsync: this);
    _opacitycontroller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _expantioncontroller.dispose();
    _opacitycontroller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //478呼吸法实现过程
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('demo6'),
      ),
      body: Center(
          child: FadeTransition(
            opacity: Tween(begin: 1.0, end: 0.5).animate(_opacitycontroller),
            child: AnimatedBuilder(
              animation: _expantioncontroller,
              builder: (context, child) {
                return Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    gradient: RadialGradient(colors: [
                      Colors.blue.shade600,
                      Colors.blue.shade100
                    ], stops: [
                      _expantioncontroller.value,
                      _expantioncontroller.value + 0.1
                    ]),
                  ),
                );
              },
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _expantioncontroller.duration = Duration(seconds: 4);
          _expantioncontroller.forward();
          await Future.delayed(Duration(seconds: 4));
          _opacitycontroller.duration = Duration(milliseconds: 1750);
          _opacitycontroller.repeat(reverse: true);
          await Future.delayed(Duration(seconds: 7));
          _opacitycontroller.reset();
          _expantioncontroller.duration = Duration(seconds: 8);
          _expantioncontroller.reverse();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
