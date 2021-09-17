import 'package:flutter/material.dart';
class demo5 extends StatefulWidget {
  @override
 createState() => _demo5();
}

class _demo5 extends State<demo5>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _controller;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: ScaleTransition(
          scale: Tween(begin: 0.5,end: 2.0)
          // 　.chain(Tween())进行多组件传输
          //   .chain(CurveTween(curve: ))函数定义
              .animate(_controller),
          // scale: _controller.drive(Tween(begin: 0.5,end: 2.0)),// 将controller中的值导入驱动中让tween重新加载这个值
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller.stop();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
