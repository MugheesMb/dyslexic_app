// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dyslexiaa/Tables/six_table.dart';
import 'package:flutter/material.dart';

import '../MathActivites/table_7to11.dart';
import '../Widgets/table_widget.dart';

class TableOfFive extends StatelessWidget {
  static const routeName = "/table-of-five";
  const TableOfFive({Key? key}) : super(key: key);

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
                    child: Text("Table of 5",
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
                            builder: (context) => const TableOfSix()),
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
                TableWidget("5 x 1 = 5", "Five.mp3"),
                TableWidget("5 x 2 = 10", "Five 2s.mp3"),
                TableWidget("5 x 3 = 15", "Five 3s.mp3"),
                TableWidget("5 x 4 = 20", "Five 4s.mp3"),
                TableWidget("5 x 5 = 25", "Five 5s.mp3"),
                TableWidget("5 x 6 = 30", "Five 6s.mp3"),
                TableWidget("5 x 7 = 35", "Five 7s.mp3"),
                TableWidget("5 x 8 = 40", "Five 8s.mp3"),
                TableWidget("5 x 9 = 45", "Five 9s.mp3"),
                TableWidget("5 x 10 = 50", "Five 10s.mp3"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
