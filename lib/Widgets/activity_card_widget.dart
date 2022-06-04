// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_import

import 'package:dyslexiaa/MathActivites/math_activity_screen.dart';

import 'age_popup.dart';
import 'package:dyslexiaa/MathActivites/table_4to6.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityCardWidget extends StatelessWidget {
  final String title;
  final int activityNum;
  final String imageUrl;
  final List<int> color;
  final Widget navLink;
  const ActivityCardWidget(
      this.title, this.activityNum, this.imageUrl, this.color, this.navLink);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (size.height > 500) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, size.height / 100, 0, 0),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            color: Color.fromRGBO(color[0], color[1], color[2], 1),
            borderOnForeground: true,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => navLink));
              },
              child: Ink(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, size.height / 60, 0, 0),
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, size.height / 40, 0, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.format_list_bulleted,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Text(
                                  " " + (activityNum).toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 5, 5, 5),
                      height: size.height / 6,
                      width: size.width / 2,
                      child: Image.asset(
                        imageUrl,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        //padding: EdgeInsets.fromLTRB(0, size.height / 100, 0, 0),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            color: Color.fromRGBO(color[0], color[1], color[2], 1),
            borderOnForeground: true,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => navLink));
              },
              child: Ink(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, size.height / 60, 0, 0),
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, size.height / 40, 0, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.format_list_bulleted,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Text(
                                  " " + (activityNum).toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 5, 5, 5),
                      height: size.height / 6,
                      width: size.width / 2,
                      child: Image.asset(
                        imageUrl,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
