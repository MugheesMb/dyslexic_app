// ignore_for_file: prefer_const_constructors

import 'package:dyslexiaa/letter_recognition_game.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class LetterGameSplash extends StatelessWidget {
  static const routeName = "/letter-game-splash";
  const LetterGameSplash({Key? key}) : super(key: key);

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
          SizedBox(
              width: size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: Card(
                        color: Color.fromRGBO(14, 102, 156, 1),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(35.0),
                          child: Text(
                            "Matching The Letter",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )),
                      ),
                    ),
                  ])),
        ]),
      ]),
      nextScreen: LetterRecognitionGame(),
      duration: 2000,
      splashIconSize: 2000,
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      splashTransition: SplashTransition.fadeTransition,
      centered: true,
    ));
  }
}
