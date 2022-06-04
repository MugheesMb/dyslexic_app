// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:dyslexiaa/WritingActivites/drawing_board.dart';
import 'package:flutter/material.dart';

import '../Widgets/row_card_view.dart';
import '../activity_screen.dart';
import 'draw_letter.dart';

class WritingActivityScreen extends StatelessWidget {
  static const routeName = "/writing-activity-screen";
  const WritingActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
          title: Text("Writing", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(178, 145, 186, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ActivityScreen()),
                (Route<dynamic> route) => false,
              );
            },
          )),
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RowCardView("Write Lettes", DrawingClass(), [178, 145, 186]),
            RowCardView("Drawing Board", DrawingBoard(), [178, 145, 186])
          ],
        ),
      ),
    );
  }
}
