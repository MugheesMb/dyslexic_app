// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:dyslexiaa/MathActivites/sub7to11/subtraction_9_7to11.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Widgets/option_box.dart';
import '/MathActivites/math_activity_screen.dart';

class Subtraction7To11_8 extends StatefulWidget {
  static const routeName = "sub-7to11-8";
  const Subtraction7To11_8({Key? key}) : super(key: key);

  @override
  State<Subtraction7To11_8> createState() => _Subtraction7To11_8State();
}

class _Subtraction7To11_8State extends State<Subtraction7To11_8> {
  late int no1;
  bool selected = false;
  void generateRandomNumber1() {
    var random = Random();
    int test = 40 + random.nextInt(60 - 40);
    if (test % 2 == 0) {
      no1 = test;
    } else {
      no1 = test + 1;
    }
    selected = false;
  }

  int quesNo = 1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Size size = MediaQuery.of(context).size;
    no1 = 44;
    int ans = (no1 - 2).round();
    return Scaffold(
      appBar: AppBar(
          title: Text("Subtraction", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(194, 213, 168, 1),
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
      body: SingleChildScrollView(
        child: Stack(children: [
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
                      "Question 8 of 10",
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
                        color: Color.fromRGBO(194, 213, 168, 1)),
                    Positioned(
                        top: size.height / 30,
                        left: size.width / 5,
                        child: Text(no1.toString() + " - 2 =",
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OptionBox(ans + 2, [194, 213, 168]),
                      OptionBox(ans + 4, [194, 213, 168]),
                      SizedBox(height: size.height / 70, width: size.width / 6),
                    ]),
                SizedBox(height: size.height / 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OptionBox(ans + 3, [194, 213, 168]),
                      OptionBox(ans + 5, [194, 213, 168]),
                      OptionBox(ans + 1, [194, 213, 168])
                    ])
              ],
            ),
          ),
          AnimatedPositioned(
            width: 70.0,
            //height: 70.0,
            top: selected ? size.height / 11 : size.height / 2.06,
            left: selected ? size.width / 1.7 : size.width / 1.4,
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
                    color: Color.fromRGBO(194, 213, 168, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ans.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20),
                        ),
                      ],
                    )),
              ),
            ),
          )
        ]),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
            onPressed: () {
              if (selected == true) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Subtraction7To11_9()));
              }
            },
            child: Icon(
              Icons.arrow_right_alt,
              color: Colors.black,
            ),
            backgroundColor: Color.fromRGBO(194, 213, 168, 1)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
