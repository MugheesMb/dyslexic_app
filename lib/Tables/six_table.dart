// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dyslexiaa/Tables/seven_table.dart';
import 'package:flutter/material.dart';

import '../MathActivites/table_7to11.dart';
import '../Widgets/table_widget.dart';

class TableOfSix extends StatelessWidget {
  static const routeName = "/table-of-six";
  const TableOfSix({Key? key}) : super(key: key);

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
                    child: Text("Table of 6",
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
                            builder: (context) => const TableOfSeven()),
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
                TableWidget("6 x 1 = 6", "Six.mp3"),
                TableWidget("6 x 2 = 12", "Six 2s.mp3"),
                TableWidget("6 x 3 = 18", "Six 3s.mp3"),
                TableWidget("6 x 4 = 24", "Six 4s.mp3"),
                TableWidget("6 x 5 = 30", "Six 5s.mp3"),
                TableWidget("6 x 6 = 36", "Six 6s.mp3"),
                TableWidget("6 x 7 = 42", "Six 7s.mp3"),
                TableWidget("6 x 8 = 48", "Six 8s.mp3"),
                TableWidget("6 x 9 = 54", "Six 9s.mp3"),
                TableWidget("6 x 10 = 60", "Six 10s.mp3"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
