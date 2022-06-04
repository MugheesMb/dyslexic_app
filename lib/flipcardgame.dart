import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:dyslexiaa/flipcard_home.dart';
import 'package:dyslexiaa/progressG.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'GamesDisplay.dart';
import 'Widgets/activity_completed_popup.dart';
import 'data.dart';
import 'dart:async';

class FlipCardGame extends StatefulWidget {
  static const routeName = "/flip-card-game";
  final Level _level;
  const FlipCardGame(this._level);
  @override
  _FlipCardGameState createState() => _FlipCardGameState(_level);
}

class _FlipCardGameState extends State<FlipCardGame> {
  double flipCardGame = 0.33;
  _FlipCardGameState(this._level);

  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;

  bool _wait = false;
  late final Level _level;
  late Timer _timer;
  int _time = 5;
  late int _left;
  bool _isFinished = false;
  late List _data;

  late List<bool> _cardFlips;
  late List<GlobalKey<FlipCardState>> _cardStateKeys;

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              spreadRadius: 0.8,
              offset: Offset(2.0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(4.0),
      child: Image.asset(_data[index]),
    );
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (mounted) {
        setState(() {
          _time = _time - 1;
        });
      }
    });
  }

  void restart() {
    startTimerrr();
    startTimer();
    _isFinished = false;
    _data = getSourceArray(
      _level,
    );
    _cardFlips = getInitialItemState(_level);
    _cardStateKeys = getCardStateKeys(_level);
    //_time = 5;
    _left = (_data.length ~/ 2);
    Future.delayed(const Duration(seconds: 6), () {
      if (mounted) {
        setState(() {
          _start = true;
          _timer.cancel();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void popup() {
    showDialog(
        context: context,
        builder: (BuildContext context) => ActivityCompletePopup(
            context, const GamesDisplay(), 'You lost, try again :)'));
    timerr.cancel();
  }

  int time = 60;
  late Timer timerr;
  void timerEnd() {
    if (time == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) => ActivityCompletePopup(
              context, const GamesDisplay(), 'You lost, try again :)'));
      timerr.cancel();
    }
  }

  void startTimerrr() {
    time = 60;
    if (mounted) {
      timerr = Timer.periodic(const Duration(seconds: 1), (timerr) {
        setState(() {
          if (time > 0) {
            time--;
          } else {
            timerr.cancel();
            dispose();
            timerEnd();
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _isFinished
        ? Scaffold(
            appBar: AppBar(title: const Text("Card Game")),
            body: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              title: const Text(
                'Hurray!! You won',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        ProgressG.setFlipCardValue(flipCardGame);
                          progRef.doc(user!.id).collection('ActivityDetail').doc('Flip The Cards').set({
      "Completed": true,
    });
                      });
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => FlipHomePage()),
                        (Route<dynamic> route) => false,
                      );
                      timerr.cancel();
                    },
                    child: const Text(
                      "Back To Main Screen",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(width: 3, color: Colors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  )
                ],
              ),
            ))
        // Scaffold(
        //     body: Column(
        //       children: [
        //         Center(
        //           child: GestureDetector(
        //             onTap: () {
        //               setState(() {
        //                 restart();
        //               });
        //             },
        //             child: Container(
        //               height: 50,
        //               width: 200,
        //               alignment: Alignment.center,
        //               decoration: BoxDecoration(
        //                 color: Colors.blue,
        //                 borderRadius: BorderRadius.circular(24),
        //               ),
        //               child: Text(
        //                 "Replay",
        //                 style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 17,
        //                     fontWeight: FontWeight.w500),
        //               ),
        //             ),
        //           ),
        //         ),
        //         ElevatedButton(
        //             onPressed: () {}, child: Text("Back to main screen"))
        //       ],
        //     ),
        //   )
        : Scaffold(
            appBar: AppBar(
              title: const Text("Card Game"),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 253, 253, 253),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => FlipHomePage()),
                    (Route<dynamic> route) => false,
                  );
                  timerr.cancel();
                  setState(() {
                    timerr.cancel();
                  });
                },
              ),
              actions: <Widget>[
                const Icon(
                  Icons.timer_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                Center(
                  child: Text(
                    time.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: size.width / 20),
                GestureDetector(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        restart();
                        timerr.cancel();
                      });
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.refresh,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Reset Time",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _time > 0
                          ? Text(
                              'The cards will be hidden in $_time',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              'Only $_left pairs left',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) => _start
                            ? FlipCard(
                                key: _cardStateKeys[index],
                                onFlip: () {
                                  if (!_flip) {
                                    _flip = true;
                                    _previousIndex = index;
                                  } else {
                                    _flip = false;
                                    if (_previousIndex != index) {
                                      if (_data[_previousIndex] !=
                                          _data[index]) {
                                        _wait = true;

                                        Future.delayed(
                                            const Duration(milliseconds: 1500),
                                            () {
                                          _cardStateKeys[_previousIndex]
                                              .currentState
                                              ?.toggleCard();
                                          _previousIndex = index;
                                          _cardStateKeys[_previousIndex]
                                              .currentState
                                              ?.toggleCard();

                                          Future.delayed(
                                              const Duration(milliseconds: 160),
                                              () {
                                            setState(() {
                                              _wait = false;
                                            });
                                          });
                                        });
                                      } else {
                                        _cardFlips[_previousIndex] = false;
                                        _cardFlips[index] = false;
                                        print(_cardFlips);

                                        setState(() {
                                          _left -= 1;
                                        });
                                        if (_cardFlips
                                            .every((t) => t == false)) {
                                          print("Won");
                                          Future.delayed(
                                              const Duration(milliseconds: 160),
                                              () {
                                            setState(() {
                                              _isFinished = true;
                                              _start = false;
                                            });
                                          });
                                        }
                                      }
                                    }
                                  }
                                  setState(() {});
                                },
                                flipOnTouch: _wait ? false : _cardFlips[index],
                                direction: FlipDirection.HORIZONTAL,
                                front: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 3,
                                          spreadRadius: 0.8,
                                          offset: Offset(2.0, 1),
                                        )
                                      ]),
                                  margin: const EdgeInsets.all(4.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "pic/quest.png",
                                    ),
                                  ),
                                ),
                                back: getItem(index))
                            : getItem(index),
                        itemCount: _data.length,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(38.0),
                      child: Text(
                        "Tap on different cards to find the same animal",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}