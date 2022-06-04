// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:dyslexiaa/WritingActivites/draw_letter.dart';
import 'package:dyslexiaa/MathActivites/math_activity_screen.dart';
import 'package:dyslexiaa/ReadingActivity/reading_activity_screen.dart';
import 'package:dyslexiaa/WritingActivites/writing_activity_screen.dart';

import './Widgets/activity_card_widget.dart';
import 'package:flutter/material.dart';
import './bottom_bar.dart';

class ActivityScreen extends StatelessWidget {
  static const routeName = "/activity-screen";
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        elevation: 0,
        title: Text(" All Activities",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Lexend",
            )),
        backgroundColor: Color.fromRGBO(110, 202, 243, 1),
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavBarV2(0),
        elevation: 0,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ActivityCardWidget("Mathematics", 5, "pic/black board.jpg",
                [204, 153, 254], MathActivityScreen()),
            ActivityCardWidget("Reading", 3, "pic/kid.png", [12, 153, 172],
                ReadingActivityScreen()),
            ActivityCardWidget("Writing", 2, "pic/pencil.png", [246, 177, 135],
                WritingActivityScreen()),
          ]),
    );
  }
}
