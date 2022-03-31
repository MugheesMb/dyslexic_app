// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, no_logic_in_create_state

import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_D.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../ReadingActivity/reading_activity_screen.dart';

class FillBlanksC extends StatefulWidget {
  static const routeName = "/fill-blanks_C";
  const FillBlanksC({Key? key}) : super(key: key);

  @override
  State<FillBlanksC> createState() => _FillBlanksCState();
}

class _FillBlanksCState extends State<FillBlanksC> {
  List image = [
    "pic/apple.png",
    "pic/ball.png",
    "pic/carrot.png",
    "pic/doll.png",
    "pic/elephant.png",
    "pic/fox.png",
    "pic/glass.png",
    "pic/horse.png",
    "pic/inkpot.png",
    "pic/jacket.png",
    "pic/kite.png",
    "pic/llama.png",
    "pic/money.png",
    "pic/nose.png",
    "pic/orange.png",
    "pic/potato.png",
    "pic/queen.png",
    "pic/rice.png",
    "pic/scissors.png",
    "pic/tyre.png",
    "pic/umbrella.png",
    "pic/violin.png",
    "pic/wolf.png",
    "pic/xray.png",
    "pic/yak.png",
    "pic/zebra.png"
  ];
  List word = [
    "A P P L E",
    "B A L L",
    "C A R R O T",
    "D O L L",
    "E L E P H A N T",
    "F O X",
    "G L A S S",
    "H O R S E",
    "I N K P O T",
    "J A C K E T",
    "K I T E",
    "L L A M A",
    "M O N E Y",
    "N O S E",
    "O R A N G E",
    "P O T A T O",
    "Q U E E N",
    "R I C E",
    "S C I S S O R S",
    "T Y R E",
    "U M B R E L L A",
    "V I O L I N",
    "W O L F",
    "X R A Y",
    "Y A K",
    "Z E B R A",
  ];

  List letter = [
    "pic/A.svg",
    "pic/B.svg",
    "pic/C.svg",
    "pic/D.svg",
    "pic/E.svg",
    "pic/F.svg",
    "pic/G.svg",
    "pic/H.svg",
    "pic/I.svg",
    "pic/J.svg",
    "pic/K.svg",
    "pic/L.svg",
    "pic/M.svg",
    "pic/N.svg",
    "pic/O.svg",
    "pic/P.svg",
    "pic/Q.svg",
    "pic/R.svg",
    "pic/S.svg",
    "pic/T.svg",
    "pic/U.svg",
    "pic/V.svg",
    "pic/W.svg",
    "pic/X.svg",
    "pic/Y.svg",
    "pic/Z.svg"
  ];
  int i = 0;
  int j = 0;
  int k = 0;
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
                    child: SvgPicture.asset(
                      "pic/C.svg",
                    )),
                SizedBox(width: 50),
                Text("=",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      "pic/carrot.png",
                    ))
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 600,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 60,
                  width: 60,
                  child: Card(
                      color: Color.fromRGBO(153, 201, 169, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "C",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      )),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: Card(
                      color: Color.fromRGBO(153, 201, 169, 1),
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
                Container(
                  height: 60,
                  width: 60,
                  child: Card(
                      color: Color.fromRGBO(153, 201, 169, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "R",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      )),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: Card(
                      color: Color.fromRGBO(153, 201, 169, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "R",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      )),
                ),
                Container(
                  height: 60,
                  width: 60,
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
                  height: 60,
                  width: 60,
                  child: Card(
                      color: Color.fromRGBO(153, 201, 169, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "T",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      )),
                ),
              ]),
            ),
            SizedBox(height: 70),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                height: 60,
                width: 60,
                child: Card(
                    color: Color.fromARGB(255, 248, 4, 138),
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
              SizedBox(height: 60, width: 60),
            ])
          ],
        ),
        AnimatedPositioned(
          width: 60.0,
          //height: 70.0,
          top: selected ? 396.0 : 527.0,
          left: selected ? 265 : 256,
          //right: 290
          // bottom: selected ? 8 : 100,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: Container(
            height: 60,
            width: 60,
            child: InkWell(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Card(
                  color: Color.fromRGBO(134, 142, 244, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "O",
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
                Navigator.of(context).pushNamed(FillBlanksD.routeName);
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
