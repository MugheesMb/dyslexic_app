// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function() selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(31, 40, 71, 1), width: 1),
          borderRadius: BorderRadius.circular(25)),
      child: Container(
        width: size.width,
        child: TextButton(
          //color: Colors.blue,
          // child: Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, size.height > 700 ? 10 : 0, 0,
                    size.height > 700 ? 10 : 0),
                child: Icon(
                  Icons.circle,
                  color: Color.fromRGBO(31, 40, 71, 1),
                ),
              ),
              Text(
                answerText,
                style: TextStyle(
                    color: Color.fromRGBO(31, 40, 71, 1),
                    fontSize: size.height > 700 ? 15 : 10.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lexend"),
              ),
            ],
          ),

          onPressed: selectHandler,
        ),
      ),
    );
  }
}
