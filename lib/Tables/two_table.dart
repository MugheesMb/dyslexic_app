// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dyslexiaa/MathActivites/table_7to11.dart';
import 'package:dyslexiaa/Tables/three_table.dart';
import 'package:flutter/material.dart';

import '../Widgets/table_widget.dart';

class TableOfTwo extends StatelessWidget {
  static const routeName = "/table-of-two";
  const TableOfTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as RowCardView;
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
                    child: Text("Table of 2",
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
                            builder: (context) => const TableOfThree()),
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
                TableWidget("2 x 1 = 2", "Two.mp3"),
                TableWidget("2 x 2 = 4", "Two2.mp3"),
                TableWidget("2 x 3 = 6", "Two 3s.mp3"),
                TableWidget("2 x 4 = 8", "Two 4s.mp3"),
                TableWidget("2 x 5 = 10", "Two 5s.mp3"),
                TableWidget("2 x 6 = 12", "Two 6s.mp3"),
                TableWidget("2 x 7 = 14", "Two 7s.mp3"),
                TableWidget("2 x 8 = 16", "Two 8s.mp3"),
                TableWidget("2 x 9 = 18", "Two 9s.mp3"),
                TableWidget("2 x 10 = 20", "Two 10s.mp3"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
