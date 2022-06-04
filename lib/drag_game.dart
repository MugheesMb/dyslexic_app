import 'dart:async';

import 'package:dyslexiaa/GamesDisplay.dart';
import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:dyslexiaa/progressG.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'Widgets/activity_completed_popup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


 final progRef = FirebaseFirestore.instance.collection('ProgressDetail');

class DragGame extends StatefulWidget {
  static const routeName = "/drag-game";
  const DragGame({Key? key}) : super(key: key);

  @override
  State<DragGame> createState() => _DragGameState();
}

class _DragGameState extends State<DragGame> {
  double dragGame = 0.33;
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
              context, const GamesDisplay(), 'You lost, try again :)'));
    }
  }

  void startTimer() {
    counter = 60;
    if (mounted) {
      timerr = Timer.periodic(const Duration(seconds: 1), (timerr) {
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
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const GamesDisplay()),
              (Route<dynamic> route) => false,
            );
            setState(() {
              timerr.cancel();
            });
          },
        ),
        title: Text('Score ${score.length} / 6',
            style: const TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 63, 255, 143),
        elevation: 0,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Icon(
            Icons.timer_outlined,
            color: Colors.black,
          ),
          Center(
            child: Text(
              counter.toString(),
              style:
                  const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
              children: const [
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
                    image: const AssetImage("pic/gamebg.png"),
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
                    childWhenDragging: const Emoji(emoji: '🌱'),
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
            child: const Text(
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
            child: const Center(
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
                  progRef.doc(user!.id).collection('ActivityDetail').doc('Match The Colors').set({
      "Completed": true,
    });

              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ActivityCompletePopup(
                      context, const GamesDisplay(), 'Hurray!! You won'));
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
  const Emoji({Key? key, required this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        padding: const EdgeInsets.all(10),
        child: Text(
          emoji,
          style: const TextStyle(color: Colors.black, fontSize: 40),
        ),
      ),
    );
  }
}