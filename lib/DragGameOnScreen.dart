// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, file_names

import 'package:dyslexiaa/drag_game.dart';
import 'package:flutter/material.dart';

class DragGameOnScreen extends StatelessWidget {
  static const routeName = "/drag-game-on-screen";
  const DragGameOnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("pic/gamebg.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8), BlendMode.darken)))),
      Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              child: Card(
                color: Color.fromARGB(255, 63, 255, 143),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Text(
                    "The Matching Game",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ),
            ),
            SizedBox(height: size.height / 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.shopping_cart,
                      size: 50,
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 63, 255, 143),
                        side: BorderSide(width: 3, color: Colors.black),
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(45)),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20))),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(DragGame.routeName);
                    },
                    child: Icon(
                      Icons.play_arrow,
                      size: 80,
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 63, 255, 143),
                        side: BorderSide(width: 3, color: Colors.black),
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(75)),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20))),
                ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.settings,
                      size: 50,
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 63, 255, 143),
                        side: BorderSide(width: 3, color: Colors.black),
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(45)),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20))),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
