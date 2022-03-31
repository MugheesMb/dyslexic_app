// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, use_key_in_widget_constructors, sized_box_for_whitespace

//import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_svg/svg.dart';

import 'quizmain.dart';
import 'package:flutter/material.dart';

class Quizhome extends StatelessWidget {
  static const routeName = "/quiz-home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 1000,
          width: 420,
          child: Image(
            image: AssetImage("pic/Dyslexia Diagnosis.png"),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("pic/dy logo.svg"),
                  Text(
                    "  Diagnosis",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Before Diving into App, we would like to take quiz to check whether you have deslyxia or you are just facing lack of focus. ",
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            Text(
              "Tap \"Start\" to Intialize the Quiz",
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(QuizMain.routeName);
                  },
                  child: Text(
                    "Start",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 3, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(35),
                      ),
                      padding: EdgeInsets.fromLTRB(70, 20, 70, 20)),
                )),
          ]),
        ),
      ]),
    );
  }
}
