// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors,

import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final List<int> color;
  final String endNote;
  final Widget navlink4to6;
  final Widget navlink7to11;
  const GridViewWidget(this.title, this.imageUrl, this.color, this.navlink4to6,
      this.navlink7to11, this.endNote);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, size.height / 35, 0, 0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          color: Color.fromRGBO(color[0], color[1], color[2], 1),
          borderOnForeground: true,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => navlink4to6));
                  // Navigator.of(context).pushNamed(navlink4to6);
                },
                child: Ink(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: size.height / 5,
                        width: size.width / 2.5,
                        child: Image.asset(
                          imageUrl,
                          alignment: Alignment.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                endNote,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
