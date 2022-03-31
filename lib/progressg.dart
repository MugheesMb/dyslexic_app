// ignore_for_file: non_constant_identifier_names

class ProgressG {
  static double DragGame = 0.0;
  static double FlipCardGame = 0.0;
  static double DysGame = 0.0;

  // set and get tables value
  static void setDragGameValue(double dragGameValue) {
    DragGame = dragGameValue;
  }

  // set and get tables value
  static void setFlipCardValue(double flipCardValue) {
    FlipCardGame = flipCardValue;
  }

  // set and get tables value
  static void setDysGameValue(double dysGameValue) {
    DysGame = dysGameValue;
  }

  // set and get totalProgress
  static double TotalProgressG() {
    return DragGame + FlipCardGame + DysGame;
  }
}
