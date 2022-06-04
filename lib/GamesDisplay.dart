// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:dyslexiaa/Widgets/game_widget.dart';
import 'package:dyslexiaa/bottom_bar.dart';
import 'package:dyslexiaa/drag_game_splash.dart';
import 'package:dyslexiaa/flip_card_game_splash.dart';
import 'package:dyslexiaa/letter_game_spash.dart';
import 'package:flutter/material.dart';

class GamesDisplay extends StatefulWidget {
  static const routeName = "/games-display";
  const GamesDisplay({Key? key}) : super(key: key);

  @override
  State<GamesDisplay> createState() => _GamesDisplayState();
}

class _GamesDisplayState extends State<GamesDisplay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(110, 202, 243, 1),
          title: Text("All Games",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Lexend",
              )),
        ),
        bottomNavigationBar: BottomNavBarV2(1),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GameWidget(
                [194, 213, 168],
                "For children under 7",
                "1 min",
                "pic/apple.png",
                "Match The Colors",
                "This is a simple game that helps children improve their color recognition with fun",
                DragGameSplash()),
                 GameWidget(
                [182, 216, 243],
                "For children under 7",
                "1 min",
                "pic/yak.png",
                "Match The Letter",
                "This is a very fun games specified to dyslexic children for improving their letter recognition. It will not only help children to recognize letter but also to differentiate letters of similar shape and style",
                LetterGameSplash()),
            GameWidget(
                [255, 219, 183],
                "For children above 7",
                "1 min",
                "pic/kite.png",
                "Flip The Card",
                "This is a simple game that helps children improve their color recognition with fun",
                FlipCardGameSplash()),
           
          ],
        ));
  }
}
