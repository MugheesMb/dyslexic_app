// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_import

import 'package:dyslexiaa/Widgets/row_card_view.dart';
import 'package:dyslexiaa/activity_screen.dart';
import 'package:dyslexiaa/Tables/four_table.dart';
import 'package:dyslexiaa/MathActivites/math_activity_screen.dart';
import 'package:dyslexiaa/Tables/three_table.dart';
import 'package:dyslexiaa/Tables/two_table.dart';
import 'package:flutter/material.dart';

import '../bottom_bar.dart';

class TableContent4To6 extends StatelessWidget {
  static const routeName = "/table-4to6";
  const TableContent4To6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: Text("Tables"),
        backgroundColor: Color.fromRGBO(20, 167, 219, 1),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: BottomNavBarV2(),
      //   elevation: 0,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RowCardView("Table of 2", TableOfTwo(), [20, 167, 219]),
          RowCardView("Table of 3", TableOfThree(), [20, 167, 219]),
          RowCardView("Table of 4", TableOfFour(), [20, 167, 219])
        ],
      ),
    );
  }
}
