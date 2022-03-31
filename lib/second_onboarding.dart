// ignore_for_file: prefer_const_constructors

import 'package:dyslexiaa/third_onboarding.dart';
import 'package:flutter/material.dart';
import 'Widgets/onboard.dart';

class SecondOnboardingScreen extends StatelessWidget {
  static const routeName = "/second-onboarding-screen";
  const SecondOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: OnBoardWidget(
        bgImage: "pic/onboarding 3.png",
        illustration: "pic/illustration 2.svg",
        heading: "Build",
        description:
            "There is no shame that you are dyslexic, here is the chance to build bigger and better than before.",
        btText: "Next",
        buttonNav: ThirdOnboardingScreen.routeName,
      ),
    );
  }
}
