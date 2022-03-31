// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_A.dart';
import 'package:dyslexiaa/ReadingActivity/letters_4to6.dart';
import 'package:dyslexiaa/ReadingActivity/words_4to6.dart';
import 'package:dyslexiaa/activity_screen.dart';
import 'package:flutter/material.dart';
import 'em.dart';

import '../Widgets/row_card_view.dart';
import '../bottom_bar.dart';

class ReadingActivityScreen extends StatelessWidget {
  static const routeName = "/reading-activity-screen";
  const ReadingActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
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
        ),
        title: Text(
          "Reading",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(153, 201, 169, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RowCardView("Letter Recognition", Letters(),
                [153, 201, 169]), //255, 255, 176
            RowCardView("Words", Words4To6(), [153, 201, 169]),
            RowCardView("Fill In The Blanks", FillBlanksA(), [153, 201, 169]) //
          ],
        ),
      ),
    );
  }
}
