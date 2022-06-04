// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:dyslexiaa/MathActivites/math_activity_screen.dart';
import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:dyslexiaa/ReadingActivity/reading_activity_screen.dart';
import 'package:dyslexiaa/WritingActivites/writing_activity_screen.dart';
import 'package:dyslexiaa/progress.dart';
import 'package:flutter/material.dart';



class ActivityProgressDetail extends StatelessWidget {
  static const routeName = "activity-progress-detail";

  const ActivityProgressDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Activity Progress Detail",
        ),
        backgroundColor: Color.fromARGB(255, 207, 233, 177),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgressDetailCard(
                progress: Progress.tablevalue,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Tables",
                imageUrl: "pic/table image.png",
                route: MathActivityScreen()),
            ProgressDetailCard(
                progress: Progress.multiplyValue,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Multiplications",
                imageUrl: "pic/multiplication image.png",
                route: MathActivityScreen()),
            ProgressDetailCard(
                progress: Progress.additionValue4_6,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Additions for 4 to 6",
                imageUrl: "pic/Addition image.png",
                route: MathActivityScreen()),
            ProgressDetailCard(
                progress: Progress.additionValue7_11,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Additions for 7 to 11",
                imageUrl: "pic/Addition image.png",
                route: MathActivityScreen()),
            ProgressDetailCard(
                progress: Progress.subtraction4_6,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Subtraction for 4 to 6",
                imageUrl: "pic/Subtraction image.png",
                route: MathActivityScreen()),
            ProgressDetailCard(
                progress: Progress.subtraction7_11,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Subtraction for 7 to 11",
                imageUrl: "pic/Subtraction image.png",
                route: MathActivityScreen()),
            ProgressDetailCard(
                progress: Progress.division4_6,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Division",
                imageUrl: "pic/kid.png",
                route: MathActivityScreen()),
            ProgressDetailCard(
                progress: Progress.words_MatchValue,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Letter Recognition",
                imageUrl: "pic/apple.png",
                route: ReadingActivityScreen()),
            ProgressDetailCard(
                progress: Progress.words_Value,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Words",
                imageUrl: "pic/dino.png",
                route: ReadingActivityScreen()),
            ProgressDetailCard(
                progress: Progress.FillInBlanks,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Fill In The Blanks",
                imageUrl: "pic/girraf.png",
                route: ReadingActivityScreen()),
            ProgressDetailCard(
                progress: Progress.DrawLetter,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Write Letters",
                imageUrl: "pic/black board.jpg",
                route: WritingActivityScreen()),
            ProgressDetailCard(
                progress: Progress.drawBoard,
                color: Color.fromARGB(255, 207, 233, 177),
                title: "Drawing Board",
                imageUrl: "pic/octo.png",
                route: WritingActivityScreen()),
          ],
        ),
      ),
    );
  }
}
