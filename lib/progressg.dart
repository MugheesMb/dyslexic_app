// ignore_for_file: non_constant_identifier_names

import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final postsRef = FirebaseFirestore.instance.collection('Progress');

class ProgressG {
  static double DragGame = 0.0;
  static double FlipCardGame = 0.0;
  static double DysGame = 0.0;

  // set and get tables value
  static double setDragGameValue(double dragGameValue) {
    DragGame = dragGameValue;
    TotalProgressG();
    return DragGame;
  }

  // set and get tables value
  static double setFlipCardValue(double flipCardValue) {
    FlipCardGame = flipCardValue;
    TotalProgressG();
    return FlipCardGame;
  }

  // set and get tables value
  static double setDysGameValue(double dysGameValue) {
    DysGame = dysGameValue;
    TotalProgressG();
    return DysGame;
  }

  // set and get totalProgress
  static double TotalProgressG() {
    UserModel? user = locator.get<UserController>().currentUser;
    double over = DragGame + FlipCardGame + DysGame;
    postsRef.doc(user!.id).collection('game').doc(user.id).set({
      "GameProgress": over,
    });
    return over;
  }
}
