import 'package:flutter/material.dart';

//多个控件自动切换组件
class demo8 extends StatefulWidget {
  @override
  createState() => _demo8();
}

class _demo8 extends State<demo8> {
  final _colors = [
    Colors.blue.shade100,
    Colors.blue.shade200,
    Colors.blue.shade300,
    Colors.blue.shade400,
    Colors.blue.shade500,
    Colors.blue.shade600,
  ];
  late int _slot;

  _shuffle() {
    setState(() {
      _colors.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo8'),
      ),
      body: Listener(
          onPointerMove: (event) {
            final x = event.position.dx;
            if (x > (_slot + 1) * Box.width) {
              setState(() {
                final c = _colors[_slot];
                _colors[_slot] = _colors[_slot + 1];
                _colors[_slot + 1] = c;
                _slot++;
              });
            } else if (x < _slot * Box.width) {
              setState(() {
                final c = _colors[_slot];
                _colors[_slot] = _colors[_slot - 1];
                _colors[_slot - 1] = c;
                _slot--;
              });
            }
          },
          child: Stack(
            children: List.generate(_colors.length, (i) {
              return Box(
                color: _colors[i],
                x: 200,
                y: i * Box.height,
                onDrag: (Color color) {
                  final index = _colors.indexOf(color);
                  print("on drag $index");
                  _slot = index;
                },
                key: ValueKey(_colors[i]),
              );
            }),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffle,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Box extends StatelessWidget {
  static const width = 60.0;
  static const height = 60.0;
  static const margin = 2.0;
  final Color color;
  final double x, y;
  final Function(Color) onDrag;

  Box(
      {required this.color,
      required this.x,
      required this.y,
      required this.onDrag,
      required Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: width - margin * 2,
      height: height - margin * 2,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
    );
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      top: x,
      left: y,
      child: Draggable(
        onDragStarted: () => onDrag(color),
        child: container,
        feedback: container,
        childWhenDragging: Visibility(
          visible: false,
          child: container,
        ),
      ),
    );
  }
}
