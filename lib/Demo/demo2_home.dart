
import 'package:flutter/material.dart';

class demo2 extends StatefulWidget {
  @override
createState() => _demo2();
}

class _demo2 extends State<demo2>  {
  int _counter = 0;
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: Center(
          child: TweenAnimationBuilder(//补间动画设置关键帧
            duration: Duration(seconds: 1),
            tween: Tween(begin: 27.0, end: _big ? 60.0:27.0), //between 0~1对应value中的值
            builder: (context, double value, child) {
              return Container(
                width: 300,
                height: 300,
                color: Colors.blue,
                child: Center(
                    child: Text(
                      "hello world",
                      style: TextStyle(fontSize: value),
                    )),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _big = ! _big;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}