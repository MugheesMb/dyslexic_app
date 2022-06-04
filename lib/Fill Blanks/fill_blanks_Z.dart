// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, no_logic_in_create_state, unused_import, non_constant_identifier_names

import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_A.dart';
import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:dyslexiaa/ReadingActivity/reading_activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Widgets/activity_completed_popup.dart';
import '../progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


 final progRef = FirebaseFirestore.instance.collection('ProgressDetail');

class FillBlanksZ extends StatefulWidget {
  static const routeName = "/fill-blanks_Z";
  const FillBlanksZ({Key? key}) : super(key: key);

  @override
  State<FillBlanksZ> createState() => _FillBlanksZState();
}

class _FillBlanksZState extends State<FillBlanksZ> {
  double FillInBlanks = 0.09;
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
                    child: SvgPicture.asset("pic/Z.svg")),
                SizedBox(width: 50),
                Text("=",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                Container(
                    height: 150,
                    width: 150,
                    child: Image.asset("pic/zebra.png"))
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
                          "Z",
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
                          "R",
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
                          "A",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    )),
              ),
            ]),
            SizedBox(height: 70),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                height: 70,
                width: 70,
                child: Card(
                    color: Color.fromARGB(255, 18, 141, 65),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "J",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 70, width: 70),
            ])
          ],
        ),
        AnimatedPositioned(
          width: 70.0,
          //height: 70.0,
          top: selected ? 386.0 : 527.0,
          left: selected ? 101 : 256,
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
                  color: Color.fromARGB(255, 5, 186, 231),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "E",
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
              setState(() {
                Progress.setFillInBlanks(FillInBlanks);
                 Progress.TotalProgress();
                            progRef.doc(user!.id).collection('ActivityDetail').doc('Fill In The Blanks').set({
      "Completed": true,
    });
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ActivityCompletePopup(
                      context,
                      ReadingActivityScreen(),
                      'Hurray!! You\'ve completed the activity'));
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
