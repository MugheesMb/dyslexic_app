// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dyslexiaa/Tables/five_table.dart';
import 'package:flutter/material.dart';

import '../MathActivites/table_7to11.dart';
import '../Widgets/table_widget.dart';

class TableOfFour extends StatelessWidget {
  static const routeName = "/table-of-four";
  const TableOfFour({Key? key}) : super(key: key);

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
                    child: Text("Table of 4",
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
                            builder: (context) => const TableOfFive()),
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
                TableWidget("4 x 1 = 4", "Four.mp3"),
                TableWidget("4 x 2 = 8", "Four 2s.mp3"),
                TableWidget("4 x 3 = 12", "Four 3s.mp3"),
                TableWidget("4 x 4 = 16", "Four 4s.mp3"),
                TableWidget("4 x 5 = 20", "Four 5s.mp3"),
                TableWidget("4 x 6 = 24", "Four 6s.mp3"),
                TableWidget("4 x 7 = 28", "Four 7s.mp3"),
                TableWidget("4 x 8 = 32", "Four 8s.mp3"),
                TableWidget("4 x 9 = 36", "Four 9s.mp3"),
                TableWidget("4 x 10 = 40", "Four 10s.mp3"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
