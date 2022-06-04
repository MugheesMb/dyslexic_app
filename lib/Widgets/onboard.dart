// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
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
      height: size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.darken))),
      padding: EdgeInsets.fromLTRB(0, size.height / 5, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: size.height > 600 ? size.height / 4 : size.height / 4,
            width: size.width,
            child: SvgPicture.asset(illustration,
                height: size.height / 3.5, width: size.width),
          ),
          Container(
            child: Center(
              child: Container(
                height: size.height / 10,
                width: size.width,
                child: Text(
                  heading,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height > 600 ? 60.0 : 40,
                    fontFamily: "Dongle",
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: size.height > 600 ? size.height / 3 : size.height / 4,
            width: size.width,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.height > 600 ? 20 : 15,
                color: Colors.white,
              ),
            ),
          ),
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