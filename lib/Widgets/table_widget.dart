// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TableWidget extends StatelessWidget {
  final String tableNo;
  final String audioAsset;
  const TableWidget(this.tableNo, this.audioAsset);
  @override
  Widget build(BuildContext context) {
    AudioCache audioCache = AudioCache();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 50,
          width: 200,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            color: Color.fromARGB(255, 216, 0, 148),
            borderOnForeground: true,
            child: InkWell(
              onTap: () {
                audioCache.play(audioAsset);
              },
              child: Ink(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          tableNo,
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
