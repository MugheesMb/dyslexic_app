// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace

import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:dyslexiaa/ReadingActivity/reading_activity_screen.dart';
import 'package:flutter/material.dart';

import '../Widgets/activity_completed_popup.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../progress.dart';

class Words4To6 extends StatefulWidget {
  static const routeName = "/words4to6";
  const Words4To6({Key? key}) : super(key: key);

  @override
  State<Words4To6> createState() => _Words4To6State();
}

class _Words4To6State extends State<Words4To6> {
  double words_Value = 0.08;
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          "Words",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(153, 201, 169, 1),
      ),
      body: Stack(children: [
        Container(
          // height: 1000,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("pic/bubbles.png"),
                //fit: BoxFit.cover,
              ),
              SizedBox(height: size.height / 2),
              Image(
                image: AssetImage("pic/bubbles.png"),
              ),
            ],
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: size.height / 4,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height:
                        size.height > 700 ? size.height / 4 : size.height / 2,
                    width: size.width / 4,
                    child: SvgPicture.asset(letter[i])),
                SizedBox(width: 50),
                Text("=",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: size.height > 700 ? 50 : 30,
                        fontWeight: FontWeight.bold)),
                Container(
                    height:
                        size.height > 700 ? size.height / 4 : size.height / 2,
                    width: size.width / 4,
                    child: Image.asset(image[j]))
              ],
            ),
          ),
          Container(
            height: size.height / 7,
            width: size.width - 50,
            child: Card(
                color: Color.fromRGBO(153, 201, 169, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      word[k],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
                    ),
                  ],
                )),
          ),
        ]),
      ]),
      floatingActionButton: Container(
        height: 100,
        width: 100,
        child: FloatingActionButton(
            onPressed: () {
              setState(() {
                if (i <= 24) {
                  letter[i++];
                  image[j++];
                  word[k++];
                } else {
                  setState(() {
                    Progress.setWordsValue(words_Value);
                     Progress.TotalProgress();
                           progRef.doc(user!.id).collection('ActivityDetail').doc('Words').set({
      "Completed": true,
    });
                  });
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => ActivityCompletePopup(
                          context,
                          ReadingActivityScreen(),
                          'Hurray!! You\'ve completed the activity'));
                }
              });
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