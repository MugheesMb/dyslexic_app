// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:dyslexiaa/Widgets/onboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardScreen extends StatefulWidget {
  static const routeName = "onboarding-screen";
  OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  List<String> bgImage = [
    "pic/onboarding 2.png",
    "pic/onboarding 3.png",
    "pic/onboarding 1.png",
  ];

  List<String> illustration = [
    "pic/illustration 1.svg",
    "pic/illustration 2.svg",
    "pic/illustration 3.svg",
  ];

  List<String> heading = ["Learn", "Build", "Grow"];

  List<String> description = [
    "If your kids have dyslexiaa then no worries because dyslexic patients are more creative and more intelligent.",
    "There is no shame that you are dyslexic, here is the chance to build bigger and better than before.",
    "If anyone ever puts you down for having dyslexiaa, don't worry. Being dyslexic can actually be a big advantage, you'll grow more faster than before.",
  ];

  List<String> btText = ["Next", "Next", "Let\s go"];

  int i = 0;
  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    Navigator.of(context).pushReplacementNamed("/signup-login");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(children: [
      Positioned(
        top: 400,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bgImage[i]),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1), BlendMode.darken))),
          // padding: EdgeInsets.fromLTRB(0, 500, 0, 0)
        ),
      ),
      Scaffold(
          body: SingleChildScrollView(
            child: Column(
                    children: [
            OnBoardWidget(
              bgImage: bgImage[i],
              illustration: illustration[i],
              heading: heading[i],
              description: description[i],
              btText: btText[i],
              buttonNav: '',
              onPressed: () {
                if (i <= 1) {
                  setState(() {
                    i++;
                  });
                } else {
                  _completeOnboarding(context);
                }
              },
            ),
                    ],
                  ),
          )),
    ]);
  }
}
