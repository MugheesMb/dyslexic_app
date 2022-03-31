// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';

class GameWidget extends StatelessWidget {
  List<int> bgColor;
  String age;
  String time;
  String gameImage;
  String gameTitle;
  String gameDes;
  Widget navLink;
  GameWidget(this.bgColor, this.age, this.time, this.gameImage, this.gameTitle,
      this.gameDes, this.navLink);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        height: size.height,
        width: size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: Color.fromRGBO(bgColor[0], bgColor[1], bgColor[2], 1),
          borderOnForeground: true,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => navLink));
            },
            child: Ink(
              child: Container(
                width: size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height / 50),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.person,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          Text(age,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0))),
                          SizedBox(
                            width: size.width / 2.5,
                          ),
                          Icon(Icons.access_time,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            time,
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Container(
                          height: 150,
                          width: 150,
                          child: Center(child: Image.asset(gameImage))),
                    ),
                    Text(gameTitle,
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 5,
                      endIndent: 80,
                      indent: 80,
                    ),
                    SizedBox(height: size.height / 20),
                    Text(
                      "Description",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      gameDes,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height / 20),
                      child: Icon(Icons.play_arrow_rounded,
                          color: Color.fromARGB(255, 0, 0, 0), size: 150),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
