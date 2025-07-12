// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "pic/Launch Screen.svg",
              height: 200,
            ),
            SizedBox(height: 20),
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
      ),
    );
  }
}
