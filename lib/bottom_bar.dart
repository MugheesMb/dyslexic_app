// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, unnecessary_new

import 'package:dyslexiaa/GamesDisplay.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/activity_screen.dart';
import 'package:dyslexiaa/chatScreen/chatHome.dart';
import 'package:dyslexiaa/dashboard.dart';
import 'package:dyslexiaa/profile/Profile.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:flutter/material.dart';

class BottomNavBarV2 extends StatefulWidget {
  static const routeName = "/bottom-bar";
  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {
  UserModel? user = locator.get<UserController>().currentUser;
  int currentIndex = 5;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              color: Color.fromRGBO(245, 245, 245, 1),
              width: size.width,
              height: 80,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      child: FloatingActionButton(
                          backgroundColor: Colors.blue[300],
                          child: Icon(Icons.home),
                          elevation: 0.1,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardScreen()),
                              (Route<dynamic> route) => false,
                            );
                          }),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.apps_sharp,
                                color: currentIndex == 0
                                    ? Colors.blue
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ActivityScreen()),
                                  (Route<dynamic> route) => false,
                                );
                                setBottomBarIndex(0);
                              },
                              splashColor: Colors.white,
                            ),
                            Text("Activity")
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.games,
                                  color: currentIndex == 1
                                      ? Colors.blue
                                      : Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GamesDisplay()),
                                    (Route<dynamic> route) => false,
                                  );
                                  currentIndex = 1;
                                  //   Navigator.of(context)
                                  //       .pushNamed(GamesDisplay.routeName);
                                }),
                            Text("Games")
                          ],
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.messenger,
                                  color: currentIndex == 2
                                      ? Colors.blue
                                      : Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chat_Home()),
                                    (Route<dynamic> route) => false,
                                  );
                                }),
                            Text("Chat")
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.person,
                                  color: currentIndex == 3
                                      ? Colors.blue
                                      : Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Profile_User(user!))));
                                }),
                            Text("Profile")
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    //path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    //path.lineTo(0, 20);
    //canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
