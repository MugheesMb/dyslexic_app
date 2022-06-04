// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dyslexiaa/Tables/eight_table.dart';
import 'package:flutter/material.dart';

import '../MathActivites/table_7to11.dart';
import '../Widgets/table_widget.dart';

class TableOfSeven extends StatelessWidget {
  static const routeName = "/table-of-seven";
  const TableOfSeven({Key? key}) : super(key: key);

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
                    child: Text("Table of 7",
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
                            builder: (context) => const TableOfEight()),
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
                TableWidget("7 x 1 = 7", "Seven.mp3"),
                TableWidget("7 x 2 = 14", "Seven 2s.mp3"),
                TableWidget("7 x 3 = 21", "Seven 3s.mp3"),
                TableWidget("7 x 4 = 28", "Seven 4s.mp3"),
                TableWidget("7 x 5 = 35", "Seven 5s.mp3"),
                TableWidget("7 x 6 = 42", "Seven 6s.mp3"),
                TableWidget("7 x 7 = 49", "Seven 7s.mp3"),
                TableWidget("7 x 8 = 56", "Seven 8s.mp3"),
                TableWidget("7 x 9 = 63", "Seven 9s.mp3"),
                TableWidget("7 x 10 = 70", "Seven 10s.mp3"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
