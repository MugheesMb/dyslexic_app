// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardWidget extends StatelessWidget {
  final String bgImage; //background asset image path
  final String illustration; // illustration path
  final String heading; //heading of the onboarding screen
  final String description; //text under heading of onboarding screen
  final String btText; //button text of each onboarding screen
  final String buttonNav;

  const OnBoardWidget(
      {required this.bgImage,
      required this.illustration,
      required this.heading,
      required this.description,
      required this.btText,
      required this.buttonNav,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.darken))),
      padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(illustration,
              height: size.height / 3.5, width: size.width),
          //SizedBox(height: 20,),
          Container(
            //padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Center(
              child: Container(
                height: size.height / 10,
                width: size.width,
                child: Text(
                  heading,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontFamily: "Dongle",
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: size.height / 8,
            width: size.width,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20, color: Colors.white,
                //fontFamily: "Roboto"
              ),
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(buttonNav);
            },
            child: Text(btText),
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(108, 202, 244, 1),
                side: BorderSide(
                    width: 6, color: Color.fromRGBO(108, 202, 244, 1)),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(
                    vertical: height / 45, horizontal: width / 3)),
          )
        ],
      ),
    );
  }
}
