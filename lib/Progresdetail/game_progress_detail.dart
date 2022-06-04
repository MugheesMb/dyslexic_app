// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dyslexiaa/GamesDisplay.dart';
import 'package:dyslexiaa/MathActivites/math_activity_screen.dart';
import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:dyslexiaa/progressG.dart';
import 'package:flutter/material.dart';

class GameProgressDetail extends StatelessWidget {
  static const routeName = "game-progress-detail";
  const GameProgressDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Game Progress Detail",
          ),
          backgroundColor: Color.fromARGB(255, 207, 233, 177),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ProgressDetailCard(
              progress: ProgressG.DragGame,
              color: Color.fromARGB(255, 207, 233, 177),
              title: "Match The Colors",
              imageUrl: "pic/apple.png",
              route: GamesDisplay()),
          ProgressDetailCard(
              progress: ProgressG.FlipCardGame,
              color: Color.fromARGB(255, 207, 233, 177),
              title: "Flip The Cards",
              imageUrl: "pic/kite.png",
              route: GamesDisplay()),
          ProgressDetailCard(
              progress: ProgressG.DysGame,
              color: Color.fromARGB(255, 207, 233, 177),
              title: "Match The Letters",
              imageUrl: "pic/yak.png",
              route: GamesDisplay())
        ]));
  }
}
