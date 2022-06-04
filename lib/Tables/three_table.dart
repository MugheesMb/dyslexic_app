// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dyslexiaa/Tables/four_table.dart';
import 'package:flutter/material.dart';

import '../MathActivites/table_7to11.dart';
import '../Widgets/table_widget.dart';

class TableOfThree extends StatelessWidget {
  static const routeName = "/table-of-three";
  const TableOfThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: Text("Table of 3",
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TableOfFour()),
                      );
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
                TableWidget("3 x 1 = 3", "Three.mp3"),
                TableWidget("3 x 2 = 6", "Three 2s.mp3"),
                TableWidget("3 x 3 = 9", "Three 3s.mp3"),
                TableWidget("3 x 4 = 12", "Three 4s.mp3"),
                TableWidget("3 x 5 = 15", "Three 5s.mp3"),
                TableWidget("3 x 6 = 18", "Three 6s.mp3"),
                TableWidget("3 x 7 = 21", "Three 7s.mp3"),
                TableWidget("3 x 8 = 24", "Three 8s.mp3"),
                TableWidget("3 x 9 = 27", "Three 9s.mp3"),
                TableWidget("3 x 10 = 30", "Three 10s.mp3"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
