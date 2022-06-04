// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dyslexiaa/first_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "spash";
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: AnimatedSplashScreen(
        splash: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                "pic/Launch Screen.svg",
              ),
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 80.0,
                    fontFamily: "Dongle",
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "dys",
                        style:
                            TextStyle(color: Color.fromRGBO(108, 202, 244, 1))),
                    TextSpan(
                      text: "lexic",
                    )
                  ]),
            ),
            Text("Designed For Children",
                style: TextStyle(fontSize: 25.0, fontFamily: "Dongle"))
          ],
        ),
        nextScreen: FirstOnboardScreen(),
        duration: 2000,
        splashIconSize: 1000,
        backgroundColor: Color.fromRGBO(237, 237, 237, 1),
        splashTransition: SplashTransition.fadeTransition,
        centered: true,
      ),
    );
  }
}
