// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:flutter/material.dart';

import '../MathActivites/math_activity_screen.dart';
import '../MathActivites/table_7to11.dart';
import '../Widgets/activity_completed_popup.dart';
import '../Widgets/table_widget.dart';
import '../progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


 final progRef = FirebaseFirestore.instance.collection('ProgressDetail');
class TableOfEight extends StatefulWidget {
  static const routeName = "/table-of-eight";
  const TableOfEight({Key? key}) : super(key: key);

  @override
  State<TableOfEight> createState() => _TableOfEightState();
}

class _TableOfEightState extends State<TableOfEight> {
  @override
  Widget build(BuildContext context) {
    double tableValue = 0.08;

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: Text(
          " Math Tables",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(240, 173, 219, 1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => TableContent7To11()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Center(
                    child: Text("Table of 8",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    child: Container(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 36,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              ActivityCompletePopup(context, MathActivityScreen(),
                                  'Hurray!! You\'ve completed the activity'));
                      setState(() {
                        Progress.setTableValue(tableValue);
                        Progress.TotalProgress();
                         progRef.doc(user!.id).collection('ActivityDetail').doc('Tables').set({
      "Completed": true,
    });
                      });
                    },
                  ),
                  right: 10,
                  bottom: 20,
                )
              ],
            ),
            Center(
              child: Text(
                "Tap on any number to hear the sound.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Column(
              children: [
                TableWidget("8 x 1 = 8", "Eight.mp3"),
                TableWidget("8 x 2 = 16", "Eight 2s.mp3"),
                TableWidget("8 x 3 = 24", "Eight 3s.mp3"),
                TableWidget("8 x 4 = 32", "Eight 4s.mp3"),
                TableWidget("8 x 5 = 40", "Eight 5s.mp3"),
                TableWidget("8 x 6 = 48", "Eight 6s.mp3"),
                TableWidget("8 x 7 = 56", "Eight 7s.mp3"),
                TableWidget("8 x 8 = 64", "Eight 8s.mp3"),
                TableWidget("8 x 9 = 72", "Eight 9s.mp3"),
                TableWidget("8 x 10 = 80", "Eight 10s.mp3"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
