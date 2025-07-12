// ignore_for_file: prefer_const_constructors

import 'package:dyslexiaa/LoginAndSignup/signup_login_screen.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/dashboard.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Widgets/onboard.dart';

class ThirdOnboardingScreen extends StatelessWidget {
  static const routeName = "/third-onboarding-screen";

  const ThirdOnboardingScreen({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);

    // Check if user is signed in
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    UserModel? user = locator.get<UserController>().currentUser;

    if (firebaseUser != null || user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => DashboardScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SignupLoginScreen()),
      );
    }
  }

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
          btText: "Let's go",
          buttonNav: '',
          onPressed: () => _completeOnboarding(context),
        ));
  }
}
