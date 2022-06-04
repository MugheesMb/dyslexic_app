// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/WritingActivites/writing_activity_screen.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Widgets/activity_completed_popup.dart';
import '../progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


 final progRef = FirebaseFirestore.instance.collection('ProgressDetail');

class DrawingClass extends StatefulWidget {
  static const routeName = "image-drawing";
  const DrawingClass({Key? key}) : super(key: key);

  @override
  State<DrawingClass> createState() => _DrawingClassState();
}

class _DrawingClassState extends State<DrawingClass> {
  double DrawLetter = 0.09;
  List<String> letter = [
    "pic/Aa.svg",
    "pic/Bb.svg",
    "pic/Cc.svg",
    "pic/Dd.svg",
    "pic/Ee.svg",
    "pic/Ff.svg",
    "pic/Gg.svg",
    "pic/Hh.svg",
    "pic/Ii.svg",
    "pic/Jj.svg",
    "pic/Kk.svg",
    "pic/Ll.svg",
    "pic/Mm.svg",
    "pic/Nn.svg",
    "pic/Oo.svg",
    "pic/Pp.svg",
    "pic/Qq.svg",
    "pic/Rr.svg",
    "pic/Ss.svg",
    "pic/Tt.svg",
    "pic/Uu.svg",
    "pic/Vv.svg",
    "pic/Ww.svg",
    "pic/Xx.svg",
    "pic/Yy.svg",
    "pic/Zz.svg",
  ];
  int i = 0;
  List<Offset> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    UserModel? user = locator.get<UserController>().currentUser;
    return Scaffold(
        appBar: AppBar(
            title:
                Text("Writing Letters", style: TextStyle(color: Colors.black)),
            backgroundColor: Color.fromRGBO(178, 145, 186, 1),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WritingActivityScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            )),
        body: Stack(children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Draw over the letters then tap  Next to proceed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 3,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 0),
              GestureDetector(
                  onPanUpdate: (DragUpdateDetails details) {
                    setState(() {
                      RenderBox object =
                          context.findRenderObject() as RenderBox;
                      Offset _locationPosition =
                          object.globalToLocal(details.globalPosition);
                      _points = List.from(_points)..add(_locationPosition);
                    });
                  },
                  onPanEnd: (DragEndDetails details) =>
                      _points.add(Offset.infinite),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: SvgPicture.asset(
                            letter[i],
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 420,
                          right: 320,
                          child: CustomPaint(
                            painter: DrawingPointer(points: _points),
                            // size: Size.fromRadius(150),
                          ))
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width + 2,
                child: SvgPicture.asset("pic/Stars.svg"),
              ),
              SizedBox(
                height: 55,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (i <= 24) {
                          letter[i++];
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  ActivityCompletePopup(
                                      context,
                                      WritingActivityScreen(),
                                      'Hurray!! You\'ve completed the activity'));
                          setState(() {
                            Progress.setDrawLetter(DrawLetter);
                             Progress.TotalProgress();
                             progRef.doc(user!.id).collection('ActivityDetail').doc('Write Letters').set({
      "Completed": true,
    });
                          });
                        }
                      });
                    },
                    child: Text("Next"),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(178, 145, 186, 1),
                        side: BorderSide(
                            width: 6, color: Color.fromRGBO(178, 145, 186, 1)),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                  )),
            ],
          ),
        ]));
  }
}

class DrawingPointer extends CustomPainter {
  List<Offset> points;
  DrawingPointer({required this.points});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.deepOrangeAccent
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 10.0;
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(DrawingPointer oldDelegate) =>
      oldDelegate.points != points;
}
