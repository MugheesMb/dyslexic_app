// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final progRef = FirebaseFirestore.instance.collection('ProgressDetail');
UserModel? user = locator.get<UserController>().currentUser;



class ProgressDetailCard extends StatefulWidget {
  final double progress;
  final Color color;
  final String title;
  final String imageUrl;
  final Widget route;
  const ProgressDetailCard(
      {required this.progress,
      required this.color,
      required this.title,
      required this.imageUrl,
      required this.route});

      

  @override
  State<ProgressDetailCard> createState() => _ProgressDetailCardState();
}

class _ProgressDetailCardState extends State<ProgressDetailCard> {
  
  cloudProgressDetail() async {
    try {
      DocumentSnapshot variable = await progRef
          .doc(user!.id)
          .collection('ActivityDetail')
          .doc(widget.title)
          .get();
      //print('first');
      print(variable['Completed']);
      return variable['Completed'];
    } catch (e) {
      print(e);
    }
    // return snapshot.data();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        color: Color.fromARGB(255, 207, 233, 177),
        borderOnForeground: true,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget.route));
          },
          child: Ink(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
                      child: Text(
                        widget.title,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Container(
                        height: 60, width: 60, child: Image.asset(widget.imageUrl)),
                  ],
                ),
                FutureBuilder(
                    future: cloudProgressDetail(),
                    builder: (context, snapshot) {
                      return Row(
                        children: [
                          snapshot.data == true
                              ? Text(" Completed",
                                  style: TextStyle(color: Colors.green))
                              : Text("not Completed",
                                  style: TextStyle(color: Colors.grey)),
                          snapshot.data == true
                              ? Icon(
                                  Icons.done_rounded,
                                  color: Colors.green,
                                )
                              : Icon(
                                  
                                  Icons.not_interested_rounded,
                                  color: Colors.grey,
                                )
                        ],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
