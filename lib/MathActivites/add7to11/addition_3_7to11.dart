// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, camel_case_types

import 'package:flutter/material.dart';
import 'package:dyslexiaa/Widgets/option_box.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../math_activity_screen.dart';

import 'dart:math';

import 'addition_4_7to11.dart';

class Addition7To11_3 extends StatefulWidget {
  static const routeName = "/add-7to11-3";
  const Addition7To11_3({Key? key}) : super(key: key);

  @override
  _Addition7To11_3State createState() => _Addition7To11_3State();
}

class _Addition7To11_3State extends State<Addition7To11_3> {
  bool selected = false;
  int no1 = 42;
  void generateRandomNumber1() {
    var random = Random();
    int test = 10 + random.nextInt(20 - 10);
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
    //bool selected = false;
    int ans = (no1 + 2).round();
    return Scaffold(
      appBar: AppBar(
          title: Text("Addition", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(182, 216, 243, 1),
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
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    "Question 3 of 10",
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
                      color: Color.fromRGBO(182, 216, 243, 1)),
                  Positioned(
                      top: size.height / 30,
                      left: size.width / 7,
                      child: Text(no1.toString() + " + 2 = ",
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
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                OptionBox(ans + 2, const [182, 216, 243]),
                SizedBox(height: size.height / 70, width: size.width / 6),
                OptionBox(ans + 4, const [182, 216, 243]),
              ]),
              SizedBox(height: size.height / 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                OptionBox(ans + 3, const [182, 216, 243]),
                OptionBox(ans + 5, const [182, 216, 243]),
                OptionBox(ans + 1, const [182, 216, 243])
              ])
            ],
          ),
        ),
        AnimatedPositioned(
          width: 70.0,
          //height: 70.0,
          top: selected ? size.height / 11 : size.height / 2.2,
          left: selected ? size.width / 1.8 : size.width / 2.4,
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
                  color: Color.fromRGBO(182, 216, 243, 1),
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
              setState(() {
                if (selected == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Addition7To11_4()));
                }
              });
            },
            child: Icon(
              Icons.arrow_right_alt,
              color: Colors.black,
            ),
            backgroundColor: Color.fromRGBO(182, 216, 243, 1)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
