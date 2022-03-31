// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, prefer_const_literals_to_create_immutables, duplicate_ignore, non_constant_identifier_names

import 'dart:async';

import 'package:dyslexiaa/GamesDisplay.dart';
import 'package:dyslexiaa/progress.dart';
import 'package:dyslexiaa/progressg.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'Widgets/activity_completed_popup.dart';

class DragGame extends StatefulWidget {
  static const routeName = "/drag-game";
  const DragGame({Key? key}) : super(key: key);

  @override
  State<DragGame> createState() => _DragGameState();
}

class _DragGameState extends State<DragGame> {
  double dragGame = 0.08;
  final Map<String, bool> score = {};

  /// Choices for game
  final Map choices = {
    '🍏': Colors.green,
    '🍋': Colors.yellow,
    '🍅': Colors.red,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
    '🥕': Colors.orange
  };

  // Random seed to shuffle order of items.
  int seed = 0;
  int counter = 60;
  late Timer timerr;
  void timer() {
    if (counter == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) => ActivityCompletePopup(
              context, GamesDisplay(), 'You lost, try again :)'));
    }
  }

  void startTimer() {
    counter = 60;
    if (mounted) {
      timerr = Timer.periodic(Duration(seconds: 1), (timerr) {
        setState(() {
          if (counter > 0) {
            counter--;
          } else {
            timerr.cancel();
            timer();
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => startTimer());
  }

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
              MaterialPageRoute(builder: (context) => GamesDisplay()),
              (Route<dynamic> route) => false,
            );
            setState(() {
              timerr.cancel();
            });
          },
        ),
        title: Text('Score ${score.length} / 6',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 63, 255, 143),
        elevation: 0,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Icon(
            Icons.timer_outlined,
            color: Colors.black,
          ),
          Center(
            child: Text(
              counter.toString(),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: size.width / 10),
          GestureDetector(
            onTap: () {
              if (mounted) {
                setState(() {
                  score.clear();
                  seed = 0;
                  counter = 60;
                });
              }
            },
            child: Row(
              children: [
                Icon(Icons.refresh, color: Colors.black),
                Center(
                  child: Text("Start Again",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
      // backgroundColor: Colors.pink),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color.fromARGB(255, 63, 255, 143),
      //   child: Icon(Icons.refresh, color: Colors.black),
      //   onPressed: () {
      //     setState(() {
      //       score.clear();
      //       seed = 0;
      //     });
      //   },
      // ),
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("pic/gamebg.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), BlendMode.darken)))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: choices.keys.map((emoji) {
                  return Draggable<String>(
                    data: emoji,
                    child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                    feedback: Emoji(emoji: emoji),
                    childWhenDragging: Emoji(emoji: '🌱'),
                  );
                }).toList()),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                    ..shuffle(Random(seed)),
            )
          ],
        ),
      ]),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.grey,
            child: Text(
              'Correct!',
              style: TextStyle(color: Colors.white),
            ),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(
            color: choices[emoji],
            height: 80,
            width: 200,
            child: Center(
                child: Text(
              "Match the fruit of the same color",
              textAlign: TextAlign.center,
            )),
          );
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        if (mounted) {
          setState(() {
            score[emoji] = true;
            if (seed == 5) {
              timerr.cancel();
              setState(() {
                ProgressG.setDragGameValue(dragGame);
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ActivityCompletePopup(
                      context, GamesDisplay(), 'Hurray!! You won'));
            } else {
              seed++;
              print(seed);
            }
            //plyr.play('success.mp3');
          });
        }
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key? key, required this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 40),
        ),
      ),
    );
  }
}

//AudioCache plyr = AudioCache();