// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:dyslexiaa/LoginAndSignup/signup_login_screen.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/Progresdetail/activity_progress_detail.dart';
import 'package:dyslexiaa/Progresdetail/game_progress_detail.dart';
import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:dyslexiaa/news/views/home.dart';
import 'package:dyslexiaa/parents_guidance.dart';
import 'package:dyslexiaa/progress.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'GamesDisplay.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'activity_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bottom_bar.dart';
import 'package:avatar_glow/avatar_glow.dart';

final postsRef = FirebaseFirestore.instance.collection('Progress');

class DashboardScreen extends StatefulWidget {
  static const routeName = "homescreendaash";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading = false;
  UserModel? user = locator.get<UserController>().currentUser;

  cloudProgress() async {
    try {
      DocumentSnapshot variable =
          await postsRef.doc(user!.id).collection('skils').doc(user!.id).get();
      //print('first');
      return variable['SkillsProgress'];
    } catch (e) {
      print(e);
    }
    // return snapshot.data();
  }

  cloudProgress2() async {
    try {
      DocumentSnapshot variable =
          await postsRef.doc(user!.id).collection('game').doc(user!.id).get();
      //print('first');

      return variable['GameProgress'];
    } catch (e) {
      print(e);
    }

    // return snapshot.data();
  }

  @override
  Widget build(BuildContext context) {
    locator.get<UserController>().initUser();
    UserModel? user = locator.get<UserController>().currentUser;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      bottomNavigationBar: BottomAppBar(child: BottomNavBarV2(5), elevation: 0),
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
                          child: SvgPicture.asset("pic/dy logo.svg",
                              color: Colors.white)),
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
                  Text('Dyslexia News',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Lexend")),
                  Icon(Icons.newspaper_outlined, color: Colors.white)
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsHome()));
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
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      body: Builder(builder: (context) {
        return Container(
          height: size.height,
          child: Column(
            children: [
              Stack(children: [
                Positioned(
                    // height: size.height / 50,
                    // width: size.width,
                    child: Image.asset("pic/homebg2.png")),
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
                  padding: EdgeInsets.fromLTRB(5, size.width / 3.5, 0, 0),
                  child: Text(
                    "Welcome Back",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 35,
                      fontFamily: "Lexend",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, size.width / 2.5, 0, 0),
                  child: Text(
                    user!.displayName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 35,
                      fontFamily: "Lexend",
                    ),
                  ),
                )
              ]),
              Container(
                height:
                    size.height > 550 ? size.height - 320 : size.height - 290,
                child: SingleChildScrollView(
                  child: Container(
                    //height: size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Container(
                              height: size.height > 500
                                  ? size.height / 6
                                  : size.height / 5,
                              width: size.width,
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                color: Color.fromRGBO(164, 25, 118, 1),
                                borderOnForeground: true,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontSize: 18,
                                                          fontFamily: "Lexend",
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Builder(builder: (context) {
                                                    return ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Color
                                                                    .fromRGBO(
                                                                        110,
                                                                        202,
                                                                        243,
                                                                        1)),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ActivityScreen()));
                                                        },
                                                        child: Text(
                                                          "Activities",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "Lexend",
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
                            child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          color: Color.fromRGBO(23, 111, 146, 1),
                          borderOnForeground: true,
                          child: Container(
                              height: size.height > 550
                                  ? size.height / 4
                                  : size.height / 3,
                              width: size.width,
                              child: Column(children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: Text("Progress till now",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20,
                                        fontFamily: "Lexend",
                                      )),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        padding:
                                            const EdgeInsets.only(bottom: 45.0),
                                        onPressed: () {
                                           Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ActivityProgressDetail()));
                                        },
                                        icon: Icon(
                                          Icons.arrow_back_rounded,
                                          color: Colors.white,
                                        )),
                                    Column(
                                      children: [
                                        FutureBuilder(
                                          future: cloudProgress(),
                                          builder: (context, snapshot) {
                                            return AvatarGlow(
                                              glowColor: Colors.cyanAccent,
                                              endRadius: 60.0,
                                              child: CircularPercentIndicator(
                                                animationDuration: 1500,
                                                radius: size.height > 550
                                                    ? 60.0
                                                    : 30,
                                                lineWidth: size.height > 550
                                                    ? 10.0
                                                    : 5,
                                                animation: true,
                                                percent: snapshot.hasData
                                                    ? snapshot.data as double
                                                    : 0.0,
                                                progressColor: Color.fromARGB(
                                                    255, 14, 255, 223),
                                                center: Text(
                                                  ((snapshot.hasData
                                                                  ? snapshot
                                                                          .data
                                                                      as double
                                                                  : 0.0) *
                                                              100)
                                                          .round()
                                                          .toString() +
                                                      "%",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.0,
                                                    fontFamily: "Lexend",
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text("Activity Progress",
                                              style: TextStyle(
                                                fontFamily: "Lexend",
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              )),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        FutureBuilder(
                                          future: cloudProgress2(),
                                          builder: (context, snapshot) {
                                            return AvatarGlow(
                                              glowColor: Colors.cyanAccent,
                                              endRadius: 60.0,
                                              child: CircularPercentIndicator(
                                                animationDuration: 1500,
                                                radius: size.height > 550
                                                    ? 60.0
                                                    : 30,
                                                lineWidth: size.height > 550
                                                    ? 10.0
                                                    : 5,
                                                animation: true,
                                                percent: snapshot.hasData
                                                    ? snapshot.data as double
                                                    : 0.0,
                                                progressColor: Color.fromRGBO(
                                                    14, 255, 223, 1),
                                                center: Text(
                                                  ((snapshot.hasData
                                                                  ? snapshot
                                                                          .data
                                                                      as double
                                                                  : 0.0) *
                                                              100)
                                                          .round()
                                                          .toString() +
                                                      "%",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0,
                                                      fontFamily: "Lexend",
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text("Games Progress",
                                              style: TextStyle(
                                                  fontFamily: "Lexend",
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255))),
                                        )
                                      ],
                                    ),
                                    IconButton(
                                        padding:
                                            const EdgeInsets.only(bottom: 45.0),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GameProgressDetail()));
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_rounded,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ])),
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Container(
                              height: size.height > 550
                                  ? size.height / 6
                                  : size.height / 5,
                              width: size.width,
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                color: Color.fromARGB(255, 158, 106, 39),
                                borderOnForeground: true,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                                  child: Image.asset(
                                                      "pic/rabbit.png")),
                                              Column(
                                                children: [
                                                  Text("Play new Games",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontFamily: "Lexend",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Builder(builder: (context) {
                                                    return ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Color
                                                                    .fromRGBO(
                                                                        110,
                                                                        202,
                                                                        243,
                                                                        1)),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          GamesDisplay()));
                                                        },
                                                        child: Text(
                                                          "Games",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            fontFamily:
                                                                "Lexend",
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Progress.overall = 0.0;
  Progress.tablevalue = 0.0;

  Progress.multiplyValue = 0.0;
  Progress.additionValue4_6 = 0.0;
  Progress.additionValue7_11 = 0.0;
  Progress.subtraction4_6 = 0.0;
  Progress.subtraction7_11 = 0.0;
  Progress.words_MatchValue = 0.0;
  Progress.drawBoard = 0.0;
  Progress.words_Value = 0.0;
  Progress.division4_6 = 0.0;
  Progress.FillInBlanks = 0.0;
  Progress.DrawLetter = 0.0;

  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => SignupLoginScreen()));
       

 
}
