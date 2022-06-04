// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, sized_box_for_whitespace, unused_import, avoid_print

import 'dart:async';

import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:dyslexiaa/Widgets/option_box.dart';
import 'package:dyslexiaa/progressG.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'GamesDisplay.dart';
import 'Widgets/activity_completed_popup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


 final progRef = FirebaseFirestore.instance.collection('ProgressDetail');

class LetterRecognitionGame extends StatefulWidget {
  static const routeName = "letter-game";
  const LetterRecognitionGame({Key? key}) : super(key: key);

  @override
  State<LetterRecognitionGame> createState() => _LetterRecognitionGameState();
}

class _LetterRecognitionGameState extends State<LetterRecognitionGame> {
  double dysGame = 0.34;
  int counter = 0;
  bool _isPDropped = false;
  bool _isQDropped = false;
  bool _isBDropped = false;
  bool _isDDropped = false;
  bool _isPDropped2 = false;
  bool _isQDropped2 = false;
  bool _isBDropped2 = false;
  bool _isDDropped2 = false;
  String _p = "p";
  String _q = "q";
  String _b = "b";
  String _d = "d";

  int time = 60;
  late Timer timerr;
  void timerEnd() {
    if (time == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) => ActivityCompletePopup(
              context, GamesDisplay(), 'You lost, try again :)'));
    }
  }

  void startTimer() {
    time = 60;
    if (mounted) {
      timerr = Timer.periodic(Duration(seconds: 1), (timerr) {
        setState(() {
          if (time > 0) {
            time--;
          } else {
            timerr.cancel();
            timerEnd();
          }
        });
      });
    }
  }

  bool close = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(14, 102, 156, 1),
          title: Text("Score 4 / " + counter.toString()),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 253, 253, 253),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => GamesDisplay()),
                (Route<dynamic> route) => false,
              );
              timerr.cancel();
              setState(() {
                timerr.cancel();
              });
            },
          ),
          actions: <Widget>[
            Icon(
              Icons.timer_outlined,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            Center(
              child: Text(
                time.toString(),
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: size.width / 20),
            GestureDetector(
              onTap: () {
                if (mounted) {
                  setState(() {
                    _isPDropped = false;
                    _isQDropped = false;
                    _isBDropped = false;
                    _isDDropped = false;
                    _isPDropped2 = false;
                    _isQDropped2 = false;
                    _isBDropped2 = false;
                    _isDDropped2 = false;
                    setState(() {
                      counter = 0;
                      time = 60;
                    });
                  });
                }
              },
              child: Row(
                children: [
                  Icon(Icons.refresh,
                      color: Color.fromARGB(255, 255, 255, 255)),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Start Again",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
          elevation: 0,
        ),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              DragTarget<String>(builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  height: 200,
                  width: size.width / 2,
                  child: Container(
                    height: 200,
                    width: size.width / 2,
                    child: Container(
                      height: 70,
                      width: 70,
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                            color: Color.fromRGBO(14, 102, 156, 1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [SvgPicture.asset("pic/gameq.svg")],
                            )),
                      ),
                    ),
                  ),
                );
              }, onWillAccept: (data) {
                return data == _q;
              }, onAccept: (data) {
                if (mounted) {
                  setState(() {
                    if (counter == 3) {
                      timerr.cancel();
                      counter++;
                      _isQDropped = true;
                      setState(() {
                        ProgressG.setDysGameValue(dysGame);
                            progRef.doc(user!.id).collection('ActivityDetail').doc('leterRecognition').set({
      "Completed": 0.34,
    });
                      });
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              ActivityCompletePopup(
                                  context, GamesDisplay(), 'Hurray!! You won'));
                      _isQDropped = true;
                    } else {
                      counter++;
                      _isQDropped = true;
                    }
                  });
                  //plyr.play('success.mp3');

                }
              }),
              DragTarget<String>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    height: 200,
                    width: size.width / 2,
                    child: Container(
                      height: 200,
                      width: size.width / 2,
                      child: Container(
                        height: 70,
                        width: 70,
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                              color: Color.fromRGBO(14, 102, 156, 1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [SvgPicture.asset("pic/gamep.svg")],
                              )),
                        ),
                      ),
                    ),
                  );
                },
                onWillAccept: (data) {
                  return data == _p;
                },
                onAccept: (data) {
                  if (mounted) {
                    setState(() {
                      if (counter == 3) {
                        timerr.cancel();
                        counter++;
                        _isPDropped = true;
                        setState(() {
                          ProgressG.setDysGameValue(dysGame);
                          progRef.doc(user!.id).collection('ActivityDetail').doc('leterRecognition').set({
      "Completed": 0.34,
    });
                        });
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                ActivityCompletePopup(context, GamesDisplay(),
                                    'Hurray!! You won'));
                        _isPDropped = true;
                      } else {
                        counter++;
                        _isPDropped = true;
                      }
                    });
                    //plyr.play('success.mp3');

                  }
                },
              ),
            ]), //1st_row

            //2nd_row

            //Divider(color: Colors.red, thickness: 3.0, height: 50),

            SizedBox(
              height: size.height / 3,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: !_isPDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _p,
                        child: Container(
                          height: 100,
                          width: 100.0,
                          child: Center(
                            child: Text("p",
                                style: TextStyle(
                                  fontSize: 58,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        feedback: Container(
                          height: 100.0,
                          width: 100.0,
                          child: Center(
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Text("p",
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                    Visibility(
                      visible: !_isQDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _q,
                        child: Container(
                          height: 100,
                          width: 100.0,
                          child: Center(
                            child: Text("q",
                                style: TextStyle(
                                  fontSize: 58,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        feedback: Container(
                          height: 100.0,
                          width: 100.0,
                          child: Center(
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Text("q",
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                    Visibility(
                      visible: !_isBDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _b,
                        child: Container(
                          height: 100,
                          width: 100.0,
                          child: Center(
                            child: Text("b",
                                style: TextStyle(
                                  fontSize: 58,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        feedback: Container(
                          height: 100.0,
                          width: 100.0,
                          child: Center(
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Text("b",
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                    Visibility(
                      visible: !_isDDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _d,
                        child: Container(
                          height: 100,
                          width: 100.0,
                          child: Center(
                            child: Text("d",
                                style: TextStyle(
                                  fontSize: 58,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        feedback: Container(
                          height: 100.0,
                          width: 100.0,
                          child: Center(
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Text("d",
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                  ]),
            ), //3rd_row

            Row(children: [
              DragTarget<String>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                      height: 200,
                      width: size.width / 2,
                      child: Container(
                          height: 200,
                          width: size.width / 2,
                          child: Container(
                            height: 70,
                            width: 70,
                            child: InkWell(
                              onTap: () {},
                              child: Card(
                                  color: Color.fromRGBO(14, 102, 156, 1),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("pic/gamed.svg")
                                    ],
                                  )),
                            ),
                          )));
                },
                onWillAccept: (data) {
                  return data == _d;
                },
                onAccept: (data) {
                  if (mounted) {
                    setState(() {
                      if (counter == 3) {
                        timerr.cancel();
                        counter++;
                        _isDDropped = true;
                        setState(() {
                          ProgressG.setDysGameValue(dysGame);
                          progRef.doc(user!.id).collection('ActivityDetail').doc('leterRecognition').set({
      "Completed": 0.34,
    });
                        });
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                ActivityCompletePopup(context, GamesDisplay(),
                                    'Hurray!! You won'));
                        _isDDropped = true;
                      } else {
                        counter++;
                        _isDDropped = true;
                      }
                    });
                    //plyr.play('success.mp3');

                  }
                },
              ),
              DragTarget<String>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    height: 200,
                    width: size.width / 2,
                    child: Container(
                      height: 70,
                      width: 70,
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                            color: Color.fromRGBO(14, 102, 156, 1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [SvgPicture.asset("pic/gameb.svg")],
                            )),
                      ),
                    ),
                  );
                },
                onWillAccept: (data) {
                  return data == _b;
                },
                onAccept: (data) {
                  if (mounted) {
                    setState(() {
                      if (counter == 3) {
                        timerr.cancel();
                        counter++;
                        _isBDropped = true;
                        setState(() {
                          ProgressG.setDysGameValue(dysGame);
                          progRef.doc(user!.id).collection('ActivityDetail').doc('Match The Letters').set({
      "Completed": true,
    });
                        });
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                ActivityCompletePopup(context, GamesDisplay(),
                                    'Hurray!! You won'));
                        _isBDropped = true;
                      } else {
                        counter++;
                        _isBDropped = true;
                      }
                    });
                    //plyr.play('success.mp3');

                  }
                },
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Text(
                  "Drag the letter of the same shape to it's identical box",
                  textAlign: TextAlign.center),
            )
          ]),
        ));
  }
}
