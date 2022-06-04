// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  int questionIndex;

  Question(this.questionText, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      // margin: EdgeInsets.fromLTRB(10, 00, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Question No." + (questionIndex + 1).toString(),
              style: TextStyle(
                color: Color.fromRGBO(31, 40, 71, 1),
                fontFamily: "Lexend",
                fontSize: size.height > 700 ? 22 : 15,
                //fontWeight: FontWeight.bold
              )),
          SizedBox(height: size.height > 700 ? 20 : 5),
          Center(
            child: Text(
              questionText,
              style: TextStyle(
                  fontSize: size.height > 700 ? 20 : 13,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(31, 40, 71, 1),
                  fontFamily: "Lexend"),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
