// ignore_for_file: non_constant_identifier_names

class Progress {
  static double tablevalue = 0.0;
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
  static void setDrawBoardValue(double dragBoardValue) {
    drawBoard = dragBoardValue;
  }

  // set and get tables value
  static void setTableValue(double tableNewValue) {
    tablevalue = tableNewValue;
  }

  // set and get tables value
  static void setWordsValue(double wordsNewValue) {
    words_Value = wordsNewValue;
  }

  // set and get multiply value
  static void setMultiplyValue(double multiplyNewValue) {
    multiplyValue = multiplyNewValue;
  }

  // set and get addition4_6 value
  static void setAddition4_6Value(double AdditionNewValue46) {
    additionValue4_6 = AdditionNewValue46;
  }

  // set and get addition7_11 value
  static void setAddition7_11Value(double AdditionNewValue711) {
    additionValue7_11 = AdditionNewValue711;
  }

  // set and get subtraction4_6 value
  static void setsubtraction4_6(double SubtractionNewValue46) {
    subtraction4_6 = SubtractionNewValue46;
  }

  // set and get subtraction4_6 value
  static void setsubtraction7_11(double SubtractionNewValue711) {
    subtraction7_11 = SubtractionNewValue711;
  }

  //set and get division4_6 value
  static void setdivision4_6(double division4_6New) {
    division4_6 = division4_6New;
  }

  //set and get wordsMatch value
  static void setwordsMatch(double wordsMatchNewValue) {
    words_MatchValue = wordsMatchNewValue;
  }

  //set and get Fill InBlanks value
  static void setFillInBlanks(double newFillInBlanks) {
    FillInBlanks = newFillInBlanks;
  }

  //set and get Fill InBlanks value
  static void setDrawLetter(double newDrawLetter) {
    DrawLetter = newDrawLetter;
  }

  // set and get totalProgress
  static double TotalProgress() {
    return tablevalue +
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
  }
}
