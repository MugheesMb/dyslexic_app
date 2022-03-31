// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, no_logic_in_create_state, file_names

import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_C.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../ReadingActivity/reading_activity_screen.dart';

class FillBlanksB extends StatefulWidget {
  static const routeName = "/fill-blanks_B";
  const FillBlanksB({Key? key}) : super(key: key);

  @override
  State<FillBlanksB> createState() => _FillBlanksBState();
}

class _FillBlanksBState extends State<FillBlanksB> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ReadingActivityScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: Text(
          "Fill in the blanks",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(153, 201, 169, 1),
      ),
      body: Stack(children: [
        Container(
          // height: 1000,
          width: 420,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("pic/bubbles.png"),
                //fit: BoxFit.cover,
              ),
              SizedBox(height: 400),
              Image(
                image: AssetImage("pic/bubbles.png"),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 150,
                    width: 150,
                    child: SvgPicture.asset("pic/B.svg")),
                SizedBox(width: 50),
                Text("=",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      "pic/ball.png",
                    ))
              ],
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 70,
                width: 70,
                child: Card(
                    color: Color.fromRGBO(153, 201, 169, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "B",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    )),
              ),
              Container(
                height: 70,
                width: 70,
                child: Card(
                    color: Color.fromRGBO(153, 201, 169, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    )),
              ),
              Container(
                height: 70,
                width: 70,
                child: Card(
                    color: Color.fromRGBO(153, 201, 169, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "L",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    )),
              ),
              Container(
                height: 70,
                width: 70,
                child: Card(
                    color: Color.fromRGBO(153, 201, 169, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "L",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    )),
              ),
            ]),
            SizedBox(height: 70),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 70, width: 70),
              Container(
                height: 70,
                width: 70,
                child: Card(
                    color: Color.fromARGB(255, 7, 112, 54),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Q",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    )),
              ),
            ])
          ],
        ),
        AnimatedPositioned(
          width: 70.0,
          //height: 70.0,
          top: selected ? 386.0 : 527.0,
          left: selected ? 136 : 136,
          //right: 290
          // bottom: selected ? 8 : 100,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: Container(
            height: 70,
            width: 70,
            child: InkWell(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Card(
                  color: Color.fromARGB(255, 70, 5, 53),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "A",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  )),
            ),
          ),
        )
      ]),
      floatingActionButton: Container(
        height: 100,
        width: 100,
        child: FloatingActionButton(
            onPressed: () {
              if (selected == true) {
                Navigator.of(context).pushNamed(FillBlanksC.routeName);
              }
            },
            child: Icon(
              Icons.arrow_right_alt,
              color: Colors.black,
            ),
            backgroundColor: Color.fromRGBO(153, 201, 169, 1)),
      ),
    );
  }
}
