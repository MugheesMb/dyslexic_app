// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key? key}) : super(key: key);
  static const routeName = "/animation";
  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              //width: selected ? 50.0 : 570.0,
              left: selected ? 20 : 50,
              right: 0,
              // height: selected ? 50.0 : 470.0,
              top: selected ? 70.0 : 150.0,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 70,
                    width: 70,
                    color: Colors.red,
                    child: Text(
                      "4",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
