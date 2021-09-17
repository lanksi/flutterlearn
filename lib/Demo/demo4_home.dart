import 'dart:developer';

import 'package:flutter/material.dart';

import 'animated_counter.dart';

class demo4 extends StatefulWidget {
  @override
 createState() => _demo4();
}

class _demo4 extends State<demo4> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
          child: Center(
            child: Container(
              width: 300,
              height: 120,
              child: AnimatedCounter(
                value: _counter,
                duration: Duration(
                  milliseconds: 300,
                ),
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
