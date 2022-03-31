// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AgePopup extends StatelessWidget {
  final Widget nav4to6;
  final Widget nav7to11;
  const AgePopup(
    BuildContext context,
    this.nav4to6,
    this.nav7to11,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      title: const Text(
        'Select Your Age',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => nav4to6));
              //Navigator.of(context).pushNamed(nav4to6);
            },
            child: Text(
              "4 to 6 years old",
              style: TextStyle(color: Colors.blue),
            ),
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 3, color: Colors.blue),
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.fromLTRB(70, 20, 70, 20)),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => nav7to11));
              // Navigator.of(context).pushNamed(nav7to11);
            },
            child: Text(
              "7 to 11 years old",
              style: TextStyle(color: Colors.blue),
            ),
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 3, color: Colors.blue),
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.fromLTRB(70, 20, 70, 20)),
          )
        ],
      ),
    );
  }
}
