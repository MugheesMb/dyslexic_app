import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/WritingActivites/writing_activity_screen.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../progress.dart';

 final progRef = FirebaseFirestore.instance.collection('ProgressDetail');
class DrawingBoard extends StatefulWidget {
  static const routeName = "/drawing-board";
  const DrawingBoard({Key? key}) : super(key: key);

  @override
  State<DrawingBoard> createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  double drawBoard = 0.09;
  Color selectedColor = Colors.black;
  double strokeWidth = 5;
   List<DrawingPoint?> drawingPoints = [];
  List<Color> colors = [
    Colors.pink,
    Colors.black87,
    Colors.yellow,
    Colors.red,
    Colors.amberAccent,
    Colors.purple,
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
     UserModel? user = locator.get<UserController>().currentUser;
    return Scaffold(
      appBar: AppBar(
          title: const Text("Drawing Board", style: TextStyle(color: Colors.black)),
          backgroundColor: const Color.fromRGBO(178, 145, 186, 1),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                Progress.setDrawBoardValue(drawBoard);
 Progress.TotalProgress();

    progRef.doc(user!.id).collection('ActivityDetail').doc('Drawing Board').set({
      "Completed": true,
    });
    
              });
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const WritingActivityScreen()),
                (Route<dynamic> route) => false,
              );
            },
          )),
      body: Stack(
        children: [
          GestureDetector(
            onPanStart: (details) {
              setState(() {
                drawingPoints.add(
                  DrawingPoint(
                    details.localPosition,
                    Paint()
                      ..color = selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round,
                  ),
                );
              });
            },
            onPanUpdate: (details) {
              setState(() {
                drawingPoints.add(
                  DrawingPoint(
                    details.localPosition,
                    Paint()
                      ..color = selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round,
                  ),
                );
              });
            },
            onPanEnd: (val) {
              setState(() {
                drawingPoints.add(null);

              });
            },
            child: CustomPaint(
              painter: DrawingPainter(drawingPoints),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned(
              top: 40,
              right: 30,
              child: Row(
                children: [
                  Slider(
                      thumbColor: const Color.fromRGBO(178, 145, 186, 1),
                      activeColor: const Color.fromRGBO(178, 145, 186, 1),
                      min: 0,
                      max: 40,
                      value: strokeWidth,
                      onChanged: (val) => setState(() => strokeWidth = val)),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(178, 145, 186, 1)),
                    onPressed: () => setState(() => drawingPoints = []),
                    icon: const Icon(Icons.clear),
                    label: const Text("Clear Board"),
                  )
                ],
              ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              colors.length,
              (index) => _buildColorChoose(colors[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorChoose(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        height: isSelected ? 47 : 40,
        width: isSelected ? 47 : 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> drawingPoints;

  DrawingPainter(this.drawingPoints);
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints.length - 1; i++) {
      DrawingPoint? current = drawingPoints[i];
      DrawingPoint? next = drawingPoints[i + 1];
      if (current != null && next != null) {
        canvas.drawLine(current.offset, next.offset, current.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
   Offset offset;
   Paint paint;

  DrawingPoint(this.offset, this.paint);
}