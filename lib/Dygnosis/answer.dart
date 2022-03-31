// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function() selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(31, 40, 71, 1), width: 2),
          borderRadius: BorderRadius.circular(25)),
      child: Container(
        width: double.infinity,
        child: TextButton(
          //color: Colors.blue,
          // child: Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Icon(
                  Icons.circle,
                  color: Color.fromRGBO(31, 40, 71, 1),
                ),
              ),
              Text(
                answerText,
                style: TextStyle(
                    color: Color.fromRGBO(31, 40, 71, 1),
                    fontSize: 15,
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
