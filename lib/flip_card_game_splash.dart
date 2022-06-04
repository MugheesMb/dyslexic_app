// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'flipcard_home.dart';

class FlipCardGameSplash extends StatelessWidget {
  static const routeName = "/flip-card-game-splash";
  const FlipCardGameSplash({Key? key}) : super(key: key);

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
                        color: Color.fromRGBO(150, 106, 21, 1),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(35.0),
                          child: Text(
                            "Flip The Cards",
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
      nextScreen: FlipHomePage(),
      duration: 2000,
      splashIconSize: 2000,
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      splashTransition: SplashTransition.fadeTransition,
      centered: true,
    ));
  }
}
