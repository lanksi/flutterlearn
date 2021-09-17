
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class demo3 extends StatefulWidget {
  @override
  createState() => _demo3();
}

class _demo3 extends State<demo3>
    with SingleTickerProviderStateMixin {//ticker表示刷新的时候产生一个tick
  //获取手机赫兹数据
  int _counter = 0;
  late AnimationController _controller;
  bool _loading = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child:
        // CircularProgressIndicator(),  //flutter自带组件
        RotationTransition(
          turns: _controller,
          child: Icon(
            Icons.refresh,
            size: 60,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_loading){
            _controller.stop();
          }else{
            _controller.repeat();
          }
          _loading =! _loading;
          // _controller.reset();//停止
          // _controller.repeat();//一直转
          // _controller.forward();//向前转
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
