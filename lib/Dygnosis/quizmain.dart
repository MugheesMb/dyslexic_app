// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import, avoid_print

import 'package:dyslexiaa/Dygnosis/question.dart';

import 'Result.dart';
import 'quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuizMain extends StatefulWidget {
  static const routeName = "/quiz-main";
  const QuizMain({Key? key}) : super(key: key);

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizMain> {
  final _questions = const [
    {
      'questionText':
          'Does your child has poor and inconsistent spelling mistake?',
      'answers': [
        {'text': 'Yes, all the time', 'score': 5},
        {'text': 'Often', 'score': 2},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Never', 'score': 0},
      ],
    },
    {
      'questionText':
          'Does your child hesitates to read loud both alone and in a group?',
      'answers': [
        {'text': 'Yes, can\'t pronounce clearly', 'score': 5},
        {'text': 'Yes, but due to lack of confidence', 'score': 2},
        {'text': 'Don\'t know, ', 'score': 3},
        {'text': 'Never', 'score': 0},
      ],
    },
    {
      'questionText':
          'Does your child face reading problems and failure in acadmeics?',
      'answers': [
        {'text': 'Yes, all the time', 'score': 5},
        {'text': 'Often', 'score': 2},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Never', 'score': 0},
      ],
    },
    {
      'questionText':
          'Does your Child face problems such as reversing sounds in words or confusing words that sounds alike?',
      'answers': [
        {'text': 'Yes, all the time', 'score': 5},
        {'text': 'Often', 'score': 2},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Never', 'score': 0},
      ],
    },
    {
      'questionText':
          'Does your child is facing low-self esteem, negative attitude and poor Socialization towards school and learning?',
      'answers': [
        {'text': 'Yes, all the time', 'score': 5},
        {'text': 'Often', 'score': 2},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Never', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  List<String> image = [
    "pic/Dyslexia Diagnosis.png",
    "pic/Dyslexia Diagnosis 1.png",
    "pic/Dyslexia Diagnosis 2.png",
    "pic/Dyslexia Diagnosis 3.png",
    "pic/Dyslexia Diagnosis 4.png"
  ];

  int i = 0;
  int percon = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
      if (i < 4) {
        i++;
      } else {
        i = 0;
      }
      percon = percon + 20;
      if (i != 0) {
        j1 = true;
      }
      if (i == 2) {
        j2 = true;
      }
      if (i == 3) {
        j3 = true;
      }
      if (i == 4) {
        j4 = true;
      }
      if (!(_questionIndex < _questions.length)) {
        j5 = true;
      }
    });
  }

  bool j1 = false;
  bool j2 = false;
  bool j3 = false;
  bool j4 = false;
  bool j5 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(31, 40, 71, 1),
        body: Column(children: [
          Padding(
              padding: EdgeInsets.fromLTRB(
                  0, size.height > 700 ? size.height / 10 : 5, 0, 0),
              child: Text("Dyslexia Diagnosis",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.height > 700 ? 25 : 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lexend"))),
          Padding(
            padding: EdgeInsets.fromLTRB(0, size.height / 20, 0, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: Card(
                        color: Color.fromRGBO(31, 40, 71, 1),
                        child: Center(
                            child: j1 == false
                                ? Text(
                                    "1",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height > 700 ? 20 : 15),
                                  )
                                : Icon(Icons.check,
                                    color: Colors.white,
                                    size: size.height > 700 ? 20 : 15)),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(35),
                        )),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Card(
                        color: Color.fromRGBO(31, 40, 71, 1),
                        child: Center(
                            child: j2 == false
                                ? Text(
                                    "2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height > 700 ? 20 : 15),
                                  )
                                : Icon(Icons.check,
                                    color: Colors.white,
                                    size: size.height > 700 ? 20 : 15)),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(35),
                        )),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Card(
                        color: Color.fromRGBO(31, 40, 71, 1),
                        child: Center(
                            child: j3 == false
                                ? Text(
                                    "3",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height > 700 ? 20 : 15),
                                  )
                                : Icon(Icons.check,
                                    color: Colors.white,
                                    size: size.height > 700 ? 20 : 15)),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(35),
                        )),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Card(
                        color: Color.fromRGBO(31, 40, 71, 1),
                        child: Center(
                            child: j4 == false
                                ? Text(
                                    "4",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height > 500 ? 20 : 15),
                                  )
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: size.height > 500 ? 20 : 15,
                                  )),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(35),
                        )),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Card(
                        color: Color.fromRGBO(31, 40, 71, 1),
                        child: Center(
                            child: j5 == false
                                ? Text(
                                    "5",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height > 500 ? 20 : 15),
                                  )
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: size.height > 700 ? 20 : 15,
                                  )),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(35),
                        )),
                  )
                ]),
          ),
          _questionIndex < _questions.length
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Column(
                            children: [
                              quiz(
                                answerQuestion: _answerQuestion,
                                questionIndex: _questionIndex,
                                questions: _questions,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(size.width / 10,
                          size.height / 50, size.width / 10, 0),
                      child: Text(
                          "Select the most suitable answer according to your child's bahvior  and over all performance",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.height > 700 ? 20 : 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: "Lexend")),
                    ),
                  ],
                )
              : Result(_totalScore, _resetQuiz),
        ]),
      ),
    );
  }
}
