// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dyslexiaa/Tables/eight_table.dart';
import 'package:flutter/material.dart';

import '/Widgets/row_card_view.dart';
import '../Tables/five_table.dart';
import '../Tables/four_table.dart';
import '../Tables/six_table.dart';
import '../Tables/three_table.dart';
import '../Tables/two_table.dart';
import '../Tables/seven_table.dart';
import 'math_activity_screen.dart';

class TableContent7To11 extends StatelessWidget {
  static const routeName = "/table-7to11";
  const TableContent7To11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
          title: Text("Tables", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(240, 173, 219, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MathActivityScreen()),
                (Route<dynamic> route) => false,
              );
            },
          )),
      // bottomNavigationBar: BottomAppBar(
      //   child: BottomNavBarV2(),
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RowCardView("Table of 2", TableOfTwo(), [240, 173, 219]),
            RowCardView("Table of 3", TableOfThree(), [240, 173, 219]),
            RowCardView("Table of 4", TableOfFour(), [240, 173, 219]),
            RowCardView("Table of 5", TableOfFive(), [240, 173, 219]),
            RowCardView("Table of 6", TableOfSix(), [240, 173, 219]),
            RowCardView("Table of 7", TableOfSeven(), [240, 173, 219]),
            RowCardView("Table of 8", TableOfEight(), [240, 173, 219])
          ],
        ),
      ),
    );
  }
}
