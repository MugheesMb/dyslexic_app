// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, file_names

import 'package:dyslexiaa/chatScreen/chatHome.dart';
import 'package:dyslexiaa/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Result extends StatelessWidget {
  final int resultScore;

  final Function() resetHandler;

  Result(this.resultScore, this.resetHandler);

  double get resultPer {
    double resultNum = 0.1;
    if (resultScore > 14) {
      resultNum = 0.95;
    } else if (resultScore > 7) {
      resultNum = 0.7;
    } else if (resultScore > 0) {
      resultNum = 0.5;
    }
    return resultNum;
  }

  String get resultPhrase {
    String resultText = "There might be some problem with the system";
    if (resultScore > 14) {
      resultText =
          "According to our calculations, there is 95% chance that your child is facing dyslexia, which seems extreme";
    } else if (resultScore > 7) {
      resultText =
          "According to our calculations, there is 70% chance that your child is facing dyslexia, which seems normal";
    } else if (resultScore > 0) {
      resultText =
          "According to our calculations, there is 50% chance that your child is facing dyslexia, which seems mild";
    } else if (resultScore == 0) {
      resultText =
          "According to our calculations, there is only 10% chance that your child is facing dyslexia, you don't need to worry";
    }
    //else {
    //   resultText =
    //       "According to our calculations, there is only 10% chance that your child is facing dyslexia, you don't need to worry";
    // }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
            resultPhrase,
            style: TextStyle(
                fontSize: size.height > 700 ? 22 : 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Lexend"),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              size.width / 10,
              size.height > 700 ? 10 : 5,
              size.width / 10,
              size.height > 700 ? 10 : 5),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 100,
            animation: true,
            lineHeight: 30.0,
            backgroundColor: Colors.white,
            animationDuration: 2000,
            percent: resultPer,
            center: Text(
              (resultPer * 100).round().toString() + "%",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.greenAccent,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(05, 35, 05, 5),
          child: Text(
            "If you don't know what to do, you're always welcome to consult with a psychologist",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontFamily: "Lexend"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.height > 700 ? 20 : 10),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
            child: Text(
              "Move to Dashboard",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: size.height > 700 ? 20 : 15),
            ),
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 3, color: Colors.white),
                shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(35),
                ),
                padding: EdgeInsets.fromLTRB(50, 20, 50, 20)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.height > 700 ? 20 : 10),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => chat_Home()));
            },
            child: Text(
              "Consult with Psychologist",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: size.height > 700 ? 20 : 15),
            ),
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 3, color: Colors.white),
                shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(35),
                ),
                padding: EdgeInsets.fromLTRB(50, 20, 50, 20)),
          ),
        ),
      ],
    );
  }
}
