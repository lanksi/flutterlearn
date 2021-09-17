import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:futterlearn/Demo/demo1_home.dart';
import 'package:futterlearn/Demo/demo2_home.dart';
import 'package:futterlearn/Demo/demo3_home.dart';
import 'package:futterlearn/Demo/demo4_home.dart';
import 'package:futterlearn/Demo/demo5_home.dart';
import 'package:futterlearn/Demo/demo7_home.dart';

import 'Demo/demo6_home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'Flutter Neumorphic',
      home: FullSampleHomePage(),
    );
  }
}

class FullSampleHomePage extends StatelessWidget {
  Widget _buildButton({required String text, required VoidCallback onClick}) {
    return NeumorphicButton(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
        //border: NeumorphicBorder(
        //  isEnabled: true,
        //  width: 0.3,
        //),
        shape: NeumorphicShape.flat,
      ),
      child: Center(child: Text(text)),
      onPressed: onClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(depth: 8),
      child: Scaffold(
        backgroundColor: NeumorphicColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildButton(
                    text: "demo1",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return demo1();
                      }));
                    },
                  ),
                  SizedBox(height: 24),
                  _buildButton(
                    text: "demo2",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return demo2();
                      }));
                    },
                  ),
                  SizedBox(height: 24),
                  _buildButton(
                    text: "demo3",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return demo3();
                      }));
                    },
                  ),
                  SizedBox(height: 24),
                  _buildButton(
                    text: "demo4",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return demo4();
                      }));
                    },
                  ),
                  SizedBox(height: 24),
                  _buildButton(
                    text: "demo5",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return demo5();
                      }));
                    },
                  ),
                  SizedBox(height: 24),
                  _buildButton(
                    text: "demo6",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return demo6();
                      }));
                    },
                  ),
                  SizedBox(height: 24),
                  _buildButton(
                    text: "demo7",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return demo7();
                      }));
                    },
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
