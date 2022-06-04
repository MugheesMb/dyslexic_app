// ignore_for_file: prefer_const_constructors

import 'package:dyslexiaa/LoginAndSignup/signup_login_screen.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/dashboard.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:flutter/material.dart';
import 'Widgets/onboard.dart';

class ThirdOnboardingScreen extends StatelessWidget {
  static const routeName = "/third-onboarding-screen";
 
UserModel? user = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
        body: OnBoardWidget(
          bgImage: "pic/onboarding 1.png",
          illustration: "pic/illustration 3.svg",
          heading: "Grow",
          description:
              "If anyone ever puts you down for having dyslexiaa, don't believe them. Being dyslexic can actually be a big advantage, you'll grow more faster than before.",
          btText: "Let/'s go",
          
          buttonNav: user != null ? DashboardScreen.routeName : SignupLoginScreen.routeName,
          
        ));
  }
}
