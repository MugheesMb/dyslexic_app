// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dyslexiaa/parents_guidance.dart';
import 'package:dyslexiaa/progress.dart';
import 'package:dyslexiaa/progressG.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'GamesDisplay.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'activity_screen.dart';
import 'bottom_bar.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "homescreendaash";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      bottomNavigationBar: BottomAppBar(child: BottomNavBarV2(), elevation: 0),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 48, 107, 155),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 150,
                          width: 150,
                          child: SvgPicture.asset("pic/dy logo.svg")),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                          ))
                    ])),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Parents Guidance',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Lexend")),
                  Icon(Icons.menu_book_outlined, color: Colors.white)
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ParentsGuidance()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Activites',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Lexend")),
                  Icon(Icons.apps, color: Colors.white)
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ActivityScreen()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Games',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Lexend")),
                  Icon(Icons.games, color: Colors.white)
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GamesDisplay()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Log Out',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Lexend")),
                  Icon(Icons.logout, color: Colors.white)
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Builder(builder: (context) {
        return Column(
          children: [
            Stack(children: [
              Positioned(child: Image.asset("pic/homebg2.png")),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height / 30),
                child: IconButton(
                    onPressed: () {
                      //_scaffoldKey.currentState.openDrawer();
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu_rounded,
                        color: Color.fromARGB(255, 0, 0, 0), size: 45)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, size.width / 3.6, 0, 0),
                child: Text(
                  "Welcome Back ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 35,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, size.width / 2.6, 0, 0),
                child: Text(
                  "abdullah",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 35,
                  ),
                ),
              ),
             
            ]),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  height: size.height / 6,
                  width: size.width,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    color: Color.fromRGBO(164, 25, 118, 1),
                    borderOnForeground: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text("Learn New Stuff",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Builder(builder: (context) {
                                        return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Color.fromRGBO(
                                                    110, 202, 243, 1)),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ActivityScreen()));
                                            },
                                            child: Text(
                                              "Activities",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 15,
                                              ),
                                            ));
                                      })
                                    ],
                                  ),
                                  Container(
                                      height: size.height / 9,
                                      // width: 120,
                                      child: Image.asset(
                                          "pic/Addition image.png")),
                                ]),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                color: Color.fromRGBO(23, 111, 146, 1),
                borderOnForeground: true,
                child: Container(
                    height: size.height / 4,
                    width: size.width,
                    child: Column(children: [
                      Text("Progress till now",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                          )),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 120.0,
                                  lineWidth: 13.0,
                                  animation: true,
                                  percent: Progress.TotalProgress(),
                                  progressColor:
                                      Color.fromARGB(255, 14, 255, 223),
                                  center: Text(
                                    (Progress.TotalProgress() * 100)
                                            .round()
                                            .toString() +
                                        "%",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                                Text("Activity Progress",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 120.0,
                                  lineWidth: 13.0,
                                  animation: true,
                                  percent: ProgressG.TotalProgressG(),
                                  progressColor:
                                      Color.fromRGBO(14, 255, 223, 1),
                                  center: Text(
                                    (ProgressG.TotalProgressG() * 100)
                                            .round()
                                            .toString() +
                                        "%",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                                Text("Games Progress",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ])),
              ),
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  height: size.height / 5.5,
                  width: size.width,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    color: Color.fromARGB(255, 158, 106, 39),
                    borderOnForeground: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: size.height / 10,
                                      //width: 1,
                                      child: Image.asset("pic/rabbit.png")),
                                  Column(
                                    children: [
                                      Text("Play new Games",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Builder(builder: (context) {
                                        return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Color.fromRGBO(
                                                    110, 202, 243, 1)),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          GamesDisplay()));
                                            },
                                            child: Text(
                                              "Games",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 15,
                                              ),
                                            ));
                                      })
                                    ],
                                  ),
                                ]),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
