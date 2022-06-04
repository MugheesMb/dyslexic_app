// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';

final postsRef = FirebaseFirestore.instance.collection('Progress');

class Progress {
  static double tablevalue = 0.0;
  static late double overall;
  static double multiplyValue = 0.0;
  static double additionValue4_6 = 0.0;
  static double additionValue7_11 = 0.0;
  static double subtraction4_6 = 0.0;
  static double subtraction7_11 = 0.0;
  static double words_MatchValue = 0.0;
  static double drawBoard = 0.0;
  static double words_Value = 0.0;
  static double division4_6 = 0.0;
  static double FillInBlanks = 0.0;
  static double DrawLetter = 0.0;

  // set and get tables value
  static double setDrawBoardValue(double dragBoardValue) {
    drawBoard = dragBoardValue;
    return drawBoard;
  }

  // set and get tables value
  static double setTableValue(double tableNewValue) {
    tablevalue = tableNewValue;
    return tablevalue;
  }

  // set and get tables value
  static double setWordsValue(double wordsNewValue) {
    words_Value = wordsNewValue;
    return words_Value;
  }

  // set and get multiply value
  static double setMultiplyValue(double multiplyNewValue) {
    multiplyValue = multiplyNewValue;
    return multiplyValue;
  }

  // set and get addition4_6 value
  static double setAddition4_6Value(double AdditionNewValue46) {
    additionValue4_6 = AdditionNewValue46;
    return additionValue4_6;
  }

  // set and get addition7_11 value
  static double setAddition7_11Value(double AdditionNewValue711) {
    additionValue7_11 = AdditionNewValue711;
    return additionValue7_11;
  }

  // set and get subtraction4_6 value
  static double setsubtraction4_6(double SubtractionNewValue46) {
    subtraction4_6 = SubtractionNewValue46;
    return subtraction4_6;
  }

  // set and get subtraction4_6 value
  static double setsubtraction7_11(double SubtractionNewValue711) {
    subtraction7_11 = SubtractionNewValue711;
    return subtraction7_11;
  }

  //set and get division4_6 value
  static double setdivision4_6(double division4_6New) {
    division4_6 = division4_6New;
    return division4_6;
  }

  //set and get wordsMatch value
  static double setwordsMatch(double wordsMatchNewValue) {
    words_MatchValue = wordsMatchNewValue;
    return words_MatchValue;
  }

  //set and get Fill InBlanks value
  static double setFillInBlanks(double newFillInBlanks) {
    FillInBlanks = newFillInBlanks;
    return FillInBlanks;
  }

  //set and get Fill InBlanks value
  static double setDrawLetter(double newDrawLetter) {
    DrawLetter = newDrawLetter;
    return DrawLetter;
  }

  // set and get totalProgress
  static double TotalProgress() {
    UserModel? user = locator.get<UserController>().currentUser;
    overall = tablevalue +
        multiplyValue +
        additionValue4_6 +
        additionValue7_11 +
        subtraction4_6 +
        subtraction7_11 +
        words_MatchValue +
        drawBoard +
        division4_6 +
        FillInBlanks +
        words_Value +
        DrawLetter;

    //connnect to database

    postsRef.doc(user!.id).collection('skils').doc(user.id).set({
      "SkillsProgress": overall,
    });

    print(overall);
    return overall;
  }
}
