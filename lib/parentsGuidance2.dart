// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace

import 'package:dyslexiaa/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParentsGuidance2 extends StatelessWidget {
  static const routeName = "parents-guidance2";
  const ParentsGuidance2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'zafiGBrFkRM',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return Scaffold(
        appBar: AppBar(
            title: Text("All about dyslexia",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            backgroundColor: Color.fromRGBO(43, 95, 129, 1),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 250, 250, 250),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 180,
              width: size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: -100,
                      width: size.width,
                      child: SvgPicture.asset("pic/circles.svg")),
                  Positioned(
                    top: size.height > 550 ? 70 : 40,
                    width: size.width,
                    child: Center(
                      child: Text(
                        "Parents Guidance",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Text("What is dyslexia?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
                Container(
                  color: Colors.lightBlue[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Dyslexia is a general term for disorders that involve difficulty in learning to read and interpret words, letters and other symbols but do not effect general intelligence.",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Text("What is dyslexia caused by?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    "What causes dyslexia? it's linked to genes, which is why the condition often runs in families. you're more likely to have dyslexia if your parents, siblings, or other family members have it. the condition stems from differences in parts of the brain that process language.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
          ]),
        ));
  }
}