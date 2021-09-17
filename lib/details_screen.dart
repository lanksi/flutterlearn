import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String path;

  const DetailScreen(this.path);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: path,
                child: Image.asset(path),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "HI WELOCOME ",
                  style: TextStyle(fontSize: 72),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "THIS IS TEXT",
                  style: TextStyle(color: Colors.grey.shade700),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
