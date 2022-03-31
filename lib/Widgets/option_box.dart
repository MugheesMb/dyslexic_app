// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  final ans;
  final List<int> color;
  const OptionBox(this.ans, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: InkWell(
        onTap: () {},
        child: Card(
            color: Color.fromRGBO(color[0], color[1], color[2], 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ans.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                ),
              ],
            )),
      ),
    );
  }
}
