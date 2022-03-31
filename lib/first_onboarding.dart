// ignore_for_file: prefer_const_constructors

import 'package:dyslexiaa/second_onboarding.dart';
import 'package:flutter/material.dart';
import 'Widgets/onboard.dart';

class FirstOnboardScreen extends StatelessWidget {
  static const routeName = "/first-onboarding-screen";
  const FirstOnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: OnBoardWidget(
        bgImage: "pic/onboarding 2.png",
        illustration: "pic/illustration 1.svg",
        heading: "Learn",
        description:
            "If your kids have dyslexiaa then no worries because dyslexic patients are more creative and more intelligent.",
        btText: "Next",
        buttonNav: SecondOnboardingScreen.routeName,
      ),
    );
  }
}
