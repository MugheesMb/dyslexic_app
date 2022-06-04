// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:dyslexiaa/MathActivites/multiply/multiplication_1.dart';
import 'package:dyslexiaa/MathActivites/sub7to11/subtraction_1_7to11.dart';
import 'package:dyslexiaa/MathActivites/subt4o6/subtratction_1_4to6.dart';
import 'package:dyslexiaa/MathActivites/table_7to11.dart';

import '../Widgets/age_popup.dart';
import '../activity_screen.dart';
import './add7to11/addition_1_7to11.dart';
import '../bottom_bar.dart';
import 'package:flutter/material.dart';
import '../Widgets/grid_view.dart';
import 'add4to6/addition_1_4to6.dart';
import 'divide/division_1.dart';

class MathActivityScreen extends StatelessWidget {
  static const routeName = "/math-activity-screen";
  const MathActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
          title: Text("Mathematics", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(204, 153, 254, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ActivityScreen()),
                (Route<dynamic> route) => false,
              );
            },
          )),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavBarV2(0),
        elevation: 0,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.6,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: <Widget>[
          GridViewWidget(
              "Table",
              "pic/table image.png",
              [240, 173, 219],
              TableContent7To11(),
              TableContent7To11(),
              "This Activity is only for children above the age of 7"),
          GridViewWidget(
              "Multiplication",
              "pic/multiplication image.png",
              [255, 219, 183],
              Multiply1(),
              Multiply1(),
              "This Activity is only for children above the age of 7"),
//Addition
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                color: Color.fromRGBO(182, 216, 243, 1),
                borderOnForeground: true,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AgePopup(
                                context, Addition4To6_1(), Addition7To11_1()));
                      },
                      child: Ink(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                "Addition",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              height: size.height / 5,
                              width: size.width / 2.5,
                              child: Image.asset(
                                "pic/Addition image.png",
                                alignment: Alignment.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // GridViewWidget("Subtraction", "pic/Subtraction image.png",
          //     [254, 110, 161], Subtraction4To6(), Subtraction7To11(), ""),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                color: Color.fromRGBO(194, 213, 168, 1),
                borderOnForeground: true,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AgePopup(context,
                                Subtraction4To6_1(), Subtraction7To11_1()));
                      },
                      child: Ink(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                "Subtration",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              height: size.height / 5,
                              width: size.width / 2.5,
                              child: Image.asset(
                                "pic/Subtraction image.png",
                                alignment: Alignment.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          GridViewWidget(
              "Division",
              "pic/kid.png",
              [224, 176, 255],
              Divide1(),
              Divide1(),
              "This Activity is only for children above the age of 7")
        ],
      ),
    );
  }
}