// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dyslexiaa/GamesDisplay.dart';
import 'package:flutter/material.dart';

import 'flipcardgame.dart';
import 'data.dart';

class FlipHomePage extends StatefulWidget {
  static const routeName = "flip-card-home";
  @override
  _FlipHomePageState createState() => _FlipHomePageState();
}

class _FlipHomePageState extends State<FlipHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Flip the Cards"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 253, 253, 253),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => GamesDisplay()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => _list[index].goto,
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.symmetric(vertical: size.height / 10),
                      //   child: Container(
                      //     height: 100,
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //         color: _list[index].primarycolor,
                      //         borderRadius: BorderRadius.circular(30),
                      //         boxShadow: [
                      //           BoxShadow(
                      //               blurRadius: 4,
                      //               color: Colors.black45,
                      //               spreadRadius: 0.5,
                      //               offset: Offset(3, 4))
                      //         ]),
                      //   ),
                      // ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height / 25),
                        child: Container(
                          height: 90,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: _list[index].secomdarycolor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.black12,
                                    spreadRadius: 0.3,
                                    offset: Offset(
                                      5,
                                      3,
                                    ))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                _list[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: genratestar(_list[index].noOfstar),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  List<Widget> genratestar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }
}

class Details {
  String name;
  Color primarycolor;
  Color secomdarycolor;
  Widget goto;
  int noOfstar;

  Details(
      {required this.name,
      required this.primarycolor,
      required this.secomdarycolor,
      required this.noOfstar,
      required this.goto});
}

List<Details> _list = [
  Details(
      name: "EASY",
      primarycolor: Colors.green,
      secomdarycolor: Colors.green,
      noOfstar: 1,
      goto: FlipCardGame(Level.Easy)),
  Details(
      name: "MEDIUM",
      primarycolor: Colors.orange,
      secomdarycolor: Colors.orange,
      noOfstar: 2,
      goto: FlipCardGame(Level.Medium)),
  Details(
      name: "HARD",
      primarycolor: Colors.red,
      secomdarycolor: Colors.red,
      noOfstar: 3,
      goto: FlipCardGame(Level.Hard))
];
