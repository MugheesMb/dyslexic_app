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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              height: size.height > 700 ? 300 : 250,
              child: SvgPicture.asset("pic/Launch Screen.svg")),
          Center(
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height > 700 ? 85 : 40,
                    fontFamily: "Dongle",
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "dys",
                        style:
                            TextStyle(color: Color.fromRGBO(108, 202, 244, 1))),
                    TextSpan(text: "lexic")
                  ]),
            ),
          ),
          Text("Designed For Children",
              style: TextStyle(
                  fontSize: size.height > 700 ? 27 : 20, fontFamily: "Dongle")),
          SizedBox(height: size.height > 700 ? 20 : 0),
          Container(
              padding: EdgeInsets.fromLTRB(0, size.height > 700 ? 20 : 5, 0, 5),
              child: ElevatedButton(
                onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
   builder: (context) => Login()
   )
 );
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
                    padding: EdgeInsets.fromLTRB(
                        size.height > 700 ? 115 : 80,
                        size.height > 700 ? 20 : 10,
                        size.height > 700 ? 115 : 80,
                        size.height > 700 ? 20 : 10)),
              )),
          Container(
              padding:
                  EdgeInsets.fromLTRB(0, size.height > 700 ? 20 : 10, 0, 5),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
   builder: (context) => Signup()
   )
 );
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
                    padding: EdgeInsets.fromLTRB(
                        size.height > 700 ? 75 : 40,
                        size.height > 700 ? 20 : 10,
                        size.height > 700 ? 75 : 40,
                        size.height > 700 ? 20 : 10)),
              ))
        ],
      ),
    );
  }
}