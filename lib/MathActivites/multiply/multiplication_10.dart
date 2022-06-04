// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, avoid_print

import 'package:dyslexiaa/MathActivites/math_activity_screen.dart';
import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:dyslexiaa/Widgets/option_box.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import '../../Widgets/activity_completed_popup.dart';
import '../../progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


 final progRef = FirebaseFirestore.instance.collection('ProgressDetail');
class Multiply10 extends StatefulWidget {
  static const routeName = "/multiplication-10";
  const Multiply10({Key? key}) : super(key: key);

  @override
  State<Multiply10> createState() => _Multiply10State();
}

class _Multiply10State extends State<Multiply10> {
  double multiplyValue = 0.08;
  late int no1;
  bool selected = false;
  int generateRandomNumber1() {
    var random = Random();
    int test = 10 + random.nextInt(20 - 10);
    if (test % 2 == 0) {
      test = test;
    } else {
      test = test + 1;
    }
    return test;
  }

  int quesNo = 1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Size size = MediaQuery.of(context).size;
    no1 = 19;
    int ans = (no1 * 2).round();
    return Scaffold(
      appBar: AppBar(
          title: Text("Multiplication", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(255, 219, 183, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MathActivityScreen()),
                (Route<dynamic> route) => false,
              );
            },
          )),
      body: Stack(children: [
        Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, size.height / 30, 0, 0),
                  child: Text(
                    "Question 10 of 10",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SvgPicture.asset("pic/think.svg",
                      color: Color.fromRGBO(255, 219, 183, 1)),
                  Positioned(
                      top: size.height / 30,
                      left: size.width / 5,
                      child: Text(no1.toString() + " x 2 =",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18)))
                ],
              ),
              Row(
                children: [
                  Container(
                      height: 200,
                      width: 200,
                      child: Image.asset("pic/kid.png")),
                ],
              ),
              SizedBox(
                height: size.height / 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                OptionBox(ans + 2, [255, 219, 183]),
                OptionBox(ans + 4, [255, 219, 183]),
                OptionBox(ans + 1, [255, 219, 183]),
              ]),
              SizedBox(height: size.height / 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(height: size.height / 70, width: size.width / 6),
                OptionBox(ans + 3, [255, 219, 183]),
                OptionBox(ans + 5, [255, 219, 183]),
              ])
            ],
          ),
        ),
        AnimatedPositioned(
          width: 70.0,
          //height: 70.0,
          top: selected ? size.height / 11 : size.height / 1.68,
          left: selected ? size.width / 1.7 : size.width / 8,
          //right: 290
          // bottom: selected ? 8 : 100,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: Container(
            height: 70,
            width: 70,
            child: InkWell(
              onTap: () {
                if (selected == false) {
                  setState(() {
                    selected = !selected;
                  });
                }
              },
              child: Card(
                  color: Color.fromRGBO(255, 219, 183, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ans.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  )),
            ),
          ),
        )
      ]),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
            onPressed: () {
              if (selected == true) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => ActivityCompletePopup(
                        context,
                        MathActivityScreen(),
                        'Hurray!! You\'ve completed the activity'));
                setState(() {
                  Progress.setMultiplyValue(multiplyValue);
                  Progress.TotalProgress();
                     progRef.doc(user!.id).collection('ActivityDetail').doc('Multiplications').set({
      "Completed": true,
    });
                  
                });
              }
            },
            child: Icon(
              Icons.arrow_right_alt,
              color: Colors.black,
            ),
            backgroundColor: Color.fromRGBO(255, 219, 183, 1)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
