// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dyslexiaa/LoginAndSignup/login.dart';
import 'package:dyslexiaa/LoginAndSignup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login.dart';

class SignupLoginScreen extends StatelessWidget {
  static const routeName = "/signup-login";
  const SignupLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: SvgPicture.asset("pic/Launch Screen.svg")),
          Center(
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 85.0,
                    fontFamily: "Dongle",
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "dys",
                        style:
                            TextStyle(color: Color.fromRGBO(108, 202, 244, 1))),
                    TextSpan(text: "lexia")
                  ]),
            ),
          ),
          Text("Designed For Children",
              style: TextStyle(fontSize: 27.0, fontFamily: "Dongle")),
          SizedBox(height: 130),
          Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Login.routeName);
                },
                child: Text("Log In"),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(108, 202, 244, 1),
                    side: BorderSide(
                        width: 6, color: Color.fromRGBO(108, 202, 244, 1)),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.fromLTRB(115, 20, 115, 20)),
              )),
          Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Signup.routeName);
                },
                child: Text(
                  "Create an Account",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 3, color: Colors.black),
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.fromLTRB(70, 20, 70, 20)),
              ))
        ],
      ),
    );
  }
}
