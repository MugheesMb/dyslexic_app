// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_field, avoid_print, non_constant_identifier_names

import 'package:avatar_glow/avatar_glow.dart';
import 'package:dyslexiaa/Progresdetail/progress_detail_card.dart';
import 'package:dyslexiaa/ReadingActivity/reading_activity_screen.dart';
import 'package:dyslexiaa/progress.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../Widgets/activity_completed_popup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


 final progRef = FirebaseFirestore.instance.collection('ProgressDetail');

class Letters extends StatefulWidget {
  static const routeName = "/letters";
  const Letters({Key? key}) : super(key: key);

  @override
  _LettersState createState() => _LettersState();
}

class _LettersState extends State<Letters> {
  double words_MatchValue = 0.10;
  List image = [
    "pic/A.svg",
    "pic/B.svg",
    "pic/C.svg",
    "pic/D.svg",
    "pic/E.svg",
    "pic/F.svg",
    "pic/G.svg",
    "pic/H.svg",
    "pic/I.svg",
    "pic/J.svg",
    "pic/K.svg",
    "pic/L.svg",
    "pic/M.svg",
    "pic/N.svg",
    "pic/O.svg",
    "pic/P.svg",
    "pic/Q.svg",
    "pic/R.svg",
    "pic/S.svg",
    "pic/T.svg",
    "pic/U.svg",
    "pic/V.svg",
    "pic/W.svg",
    "pic/X.svg",
    "pic/Y.svg",
    "pic/Z.svg"
  ];
  int i = 0;
  int j = 0;
  List textLetter = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  final Map<String, HighlightedWord> _highLights = {
    'speech': HighlightedWord(
      onTap: () => print('speech'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'special keywords': HighlightedWord(
      onTap: () => print('special keywords'),
      textStyle: const TextStyle(
        color: Colors.brown,
        fontWeight: FontWeight.bold,
      ),
    ),
    'smoothly': HighlightedWord(
      onTap: () => print('smoothly'),
      textStyle: const TextStyle(
        color: Colors.indigoAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'A': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'B': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'C': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'D': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'E': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'F': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'G': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'H': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'I': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'J': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'K': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'L': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'M': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'N': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'O': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'P': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'Q': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'R': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'S': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'T': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'U': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'V': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'W': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'X': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'Y': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
    'Z': HighlightedWord(
      onTap: () => print('Test'),
      textStyle: TextStyle(
        fontSize: 32.0,
        color: Color.fromRGBO(153, 201, 169, 1),
        fontWeight: FontWeight.bold,
        // fontFamily: "Lexend",
      ),
    ),
  };
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String text = '_';
  double _confidence = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    String word = text.toUpperCase();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ReadingActivityScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: Text(
          "Letter Recognition",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(153, 201, 169, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Color.fromRGBO(153, 201, 169, 1),
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: Container(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            onPressed: () {
              _listen();
            },
            child: Icon(_isListening ? Icons.mic : Icons.mic_none,
                size: 30, color: Colors.black),
            backgroundColor: Color.fromRGBO(153, 201, 169, 1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Press Button and Start Speaking",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lexend")),
              Container(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                child: TextHighlight(
                  text: "\"" + text.toUpperCase() + "\"",
                  words: _highLights,
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lexend",
                  ),
                ),
              ),
              SizedBox(height: 10),
              SvgPicture.asset(image[i]),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (word == textLetter[j]) {
                      j++;
                      if (i <= 24) {
                        image[i++];
                      } else {
                        //  showDialog(
                        // context: context,
                        // builder: (BuildContext context) => ActivityCompletePopup(
                        //     context, ReadingActivityScreen.routeName));
                      }
                    }
                  });
                  if (textLetter[i] == "Z") {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            ActivityCompletePopup(
                                context,
                                ReadingActivityScreen(),
                                'Hurray!! You\'ve completed the activity'));

                    setState(() {
                      Progress.setwordsMatch(words_MatchValue);
                       Progress.TotalProgress();
                          progRef.doc(user!.id).collection('ActivityDetail').doc('Letter Recognition').set({
      "Completed": true,
    });
                       
                    });
                  }
                },
                child:
                    Text("Next Letter", style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(153, 201, 169, 1),
                    side: BorderSide(
                      width: 2,
                      color: Color.fromRGBO(153, 201, 169, 1),
                    ),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.fromLTRB(115, 20, 115, 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Next Letter will not appear until you pronounce the Letter clearly",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() {
          _isListening = true;
          if (text == "ABC") {
            j = 1;
          }
        });
        _speech.listen(
            onResult: (val) => setState(() {
                  text = val.recognizedWords;
                  if (val.hasConfidenceRating && val.confidence > 0) {
                    _confidence = val.confidence;
                    if (text == "ABC") {
                      j = 1;
                    }
                  }
                }));
      }
    } else {
      setState(() {
        _isListening = false;
        if (text == "ABC") {
          j = 1;
        }
      });
      _speech.stop();
    }
  }
}
