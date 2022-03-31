// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:dyslexiaa/drag_game.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class DragGameSplash extends StatelessWidget {
  static const routeName = "/Drag-game-splash";
  const DragGameSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: AnimatedSplashScreen(
      splash: Stack(children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("pic/gamebg.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), BlendMode.darken)))),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      child: Card(
                        color: Color.fromARGB(255, 63, 255, 143),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(35.0),
                          child: Text(
                            "The Matching Game",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                      ),
                    ),
                  ])),
        ]),
      ]),
      nextScreen: DragGame(),
      duration: 2000,
      splashIconSize: 2000,
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      splashTransition: SplashTransition.fadeTransition,
      centered: true,
    ));
  }
}
