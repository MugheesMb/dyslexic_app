// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ActivityCompletePopup extends StatelessWidget {
  final Widget navLink;
  final String text;
  const ActivityCompletePopup(BuildContext context, this.navLink, this.text);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => navLink),
                (Route<dynamic> route) => false,
              );
            },
            child: Text(
              "Back To Main Screen",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue),
            ),
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 3, color: Colors.blue),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.fromLTRB(50, 20, 50, 20)),
          )
        ],
      ),
    );
  }
}
