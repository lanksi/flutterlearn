
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class demo1 extends StatefulWidget {
  @override
  createState() => _demo1();
}

class _demo1 extends State<demo1> {

  int _counter = 0;
  double _height = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: 300,
          height: _height,
          child: Center(
            child: Text(
              "hello world",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w200
              ),
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color.fromRGBO(44,127,184, 0.5),Colors.white]
              ),
              boxShadow: [BoxShadow(spreadRadius: 1,blurRadius: 20)],
              borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _height += 100;
            if(_height >500) _height =200;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
