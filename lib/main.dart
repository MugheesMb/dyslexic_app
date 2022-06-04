// @dart=2.9
// ignore_for_file: unused_import, prefer_const_constructors, use_key_in_widget_constructors
import 'package:dyslexiaa/DragGameOnScreen.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/Progresdetail/activity_progress_detail.dart';
import 'package:dyslexiaa/Progresdetail/game_progress_detail.dart';
import 'package:dyslexiaa/provider/authprovider.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_C.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_E.dart';

import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_F.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_G.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_H.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_I.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_J.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_K.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_L.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_M.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_N.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_O.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_P.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_Q.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_R.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_S.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_T.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_U.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_V.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_W.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_X.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_Y.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_Z.dart';
import 'package:dyslexiaa/GamesDisplay.dart';
import 'package:dyslexiaa/MathActivites/add4to6/addition_1_4to6.dart';
import 'package:dyslexiaa/animation.dart';
import 'package:dyslexiaa/dashboard.dart';
import 'package:dyslexiaa/MathActivites/divide/division_1.dart';
import 'package:dyslexiaa/Fill%20Blanks/fill_blanks_A.dart';
import 'package:dyslexiaa/drag_game.dart';
import 'package:dyslexiaa/WritingActivites/draw_letter.dart';
import 'package:dyslexiaa/WritingActivites/drawing_board.dart';
import 'package:dyslexiaa/LoginAndSignup/login.dart';
import 'package:dyslexiaa/news/views/home.dart';
import 'package:dyslexiaa/drag_game_splash.dart';
import 'package:dyslexiaa/flip_card_level.dart';
import 'package:dyslexiaa/flipcard_home.dart';
import 'package:dyslexiaa/flipcardgame.dart';
import 'package:dyslexiaa/letter_recognition_game.dart';
import 'package:dyslexiaa/onboard_screen.dart';
import 'package:dyslexiaa/parentsGuidance1.dart';
import 'package:dyslexiaa/parentsGuidance2.dart';
import 'package:dyslexiaa/parents_guidance.dart';
import 'package:dyslexiaa/profile.dart';
import 'package:dyslexiaa/Dygnosis/quizhome.dart';
import 'package:dyslexiaa/Dygnosis/quizmain.dart';
import 'package:dyslexiaa/ReadingActivity/letters_4to6.dart';
import 'package:dyslexiaa/ReadingActivity/reading_activity_screen.dart';
import 'package:dyslexiaa/settings.dart';
import 'package:dyslexiaa/LoginAndSignup/signup.dart';
import 'package:dyslexiaa/MathActivites/sub7to11/subtraction_1_7to11.dart';
import 'package:dyslexiaa/MathActivites/subt4o6/subtratction_1_4to6.dart';
import 'package:dyslexiaa/ReadingActivity/words_4to6.dart';
import 'package:dyslexiaa/WritingActivites/writing_activity_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Fill Blanks/fill_blanks_B.dart';
import 'Fill Blanks/fill_blanks_D.dart';
import 'MathActivites/add7to11/addition_1_7to11.dart';
import 'Tables/five_table.dart';
import 'Tables/four_table.dart';
import 'Tables/eight_table.dart';
import 'Tables/six_table.dart';
import 'Tables/seven_table.dart';
import 'Tables/two_table.dart';
import 'Tables/three_table.dart';
import 'WritingActivites/draw_letter.dart';
import 'WritingActivites/drawing_board.dart';
import 'animation.dart';
import 'Dygnosis/quizhome.dart';
import 'MathActivites/table_4to6.dart';
import 'MathActivites/table_7to11.dart';
import 'MathActivites/math_activity_screen.dart';
import './activity_screen.dart';
import './third_onboarding.dart';
import './second_onboarding.dart';
import './splash_screen.dart';
import './first_onboarding.dart';
import 'LoginAndSignup/signup_login_screen.dart';
import './bottom_bar.dart';
import 'MathActivites/multiply/multiplication_1.dart';
import 'voice.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  setupServices();
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) =>   MyApp()
  //   )
  //  );
  runApp(
      MyApp()
    
   );
}

class MyApp extends StatelessWidget {
  const MyApp();
  Future userSignedIn() async {
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return SplashScreen();
    } else {
      return SignupLoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'dyslexiaa',
        theme: ThemeData(
          fontFamily: "Lexend",
          backgroundColor: Color.fromARGB(255, 241, 239, 239),
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
            future: userSignedIn(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return snapshot.data;
              }
              return Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              ));
            }),
        routes: {
          SplashScreen.routeName: (ctx) => SplashScreen(),
          AnimationWidget.routeName: (ctx) => AnimationWidget(),
          FirstOnboardScreen.routeName: (ctx) => FirstOnboardScreen(),
          SecondOnboardingScreen.routeName: (ctx) => SecondOnboardingScreen(),
          ThirdOnboardingScreen.routeName: (ctx) => ThirdOnboardingScreen(),
          SignupLoginScreen.routeName: (ctx) => SignupLoginScreen(),
          ActivityScreen.routeName: (ctx) => ActivityScreen(),
          MathActivityScreen.routeName: (ctx) => MathActivityScreen(),
          BottomNavBarV2.routeName: (ctx) => BottomNavBarV2(5),
          TableContent4To6.routeName: (ctx) => TableContent4To6(),
          TableContent7To11.routeName: (ctx) => TableContent7To11(),
          TableOfTwo.routeName: (ctx) => TableOfTwo(),
          TableOfThree.routeName: (ctx) => TableOfThree(),
          TableOfFour.routeName: (ctx) => TableOfFour(),
          TableOfFive.routeName: (ctx) => TableOfFive(),
          TableOfSix.routeName: (ctx) => TableOfSix(),
          TableOfSeven.routeName: (ctx) => TableOfSeven(),
          TableOfEight.routeName: (ctx) => TableOfEight(),
          Multiply1.routeName: (ctx) => Multiply1(),
          Addition4To6_1.routeName: (ctx) => Addition4To6_1(),
          Addition7To11_1.routeName: (ctx) => Addition7To11_1(),
          Subtraction4To6_1.routeName: (ctx) => Subtraction4To6_1(),
          Subtraction7To11_1.routeName: (ctx) => Subtraction7To11_1(),
          Divide1.routeName: (ctx) => Divide1(),
          Letters4To6.routeName: (ctx) => Letters4To6(),
          Quizhome.routeName: (ctx) => Quizhome(),
          QuizMain.routeName: (ctx) => QuizMain(),
          Login.routeName: (ctx) => Login(),
          Signup.routeName: (ctx) => Signup(),
          ReadingActivityScreen.routeName: (ctx) => ReadingActivityScreen(),
          Words4To6.routeName: (ctx) => Words4To6(),
          DrawingClass.routeName: (ctx) => DrawingClass(),
          FillBlanksA.routeName: (ctx) => FillBlanksA(),
          FillBlanksB.routeName: (ctx) => FillBlanksB(),
          FillBlanksC.routeName: (ctx) => FillBlanksC(),
          FillBlanksD.routeName: (ctx) => FillBlanksD(),
          FillBlanksE.routeName: (ctx) => FillBlanksE(),
          FillBlanksF.routeName: (ctx) => FillBlanksF(),
          FillBlanksG.routeName: (ctx) => FillBlanksG(),
          FillBlanksH.routeName: (ctx) => FillBlanksH(),
          FillBlanksI.routeName: (ctx) => FillBlanksI(),
          FillBlanksJ.routeName: (ctx) => FillBlanksJ(),
          FillBlanksK.routeName: (ctx) => FillBlanksK(),
          FillBlanksL.routeName: (ctx) => FillBlanksL(),
          FillBlanksM.routeName: (ctx) => FillBlanksM(),
          FillBlanksN.routeName: (ctx) => FillBlanksN(),
          FillBlanksO.routeName: (ctx) => FillBlanksO(),
          FillBlanksP.routeName: (ctx) => FillBlanksP(),
          FillBlanksQ.routeName: (ctx) => FillBlanksQ(),
          FillBlanksR.routeName: (ctx) => FillBlanksR(),
          FillBlanksS.routeName: (ctx) => FillBlanksS(),
          FillBlanksT.routeName: (ctx) => FillBlanksT(),
          FillBlanksU.routeName: (ctx) => FillBlanksU(),
          FillBlanksV.routeName: (ctx) => FillBlanksV(),
          FillBlanksW.routeName: (ctx) => FillBlanksW(),
          FillBlanksX.routeName: (ctx) => FillBlanksX(),
          FillBlanksY.routeName: (ctx) => FillBlanksY(),
          FillBlanksZ.routeName: (ctx) => FillBlanksZ(),
          DashboardScreen.routeName: (ctx) => DashboardScreen(),
          DrawingBoard.routeName: (ctx) => DrawingBoard(),
          //SettingsUI.routeName: (ctx) => SettingsUI(),
          //  SettingsScreen.routeName: (ctx) => SettingsScreen(),
          DragGameOnScreen.routeName: (ctx) => DragGameOnScreen(),
          DragGame.routeName: (ctx) => DragGame(),
          DragGameSplash.routeName: (ctx) => DragGameSplash(),
          WritingActivityScreen.routeName: (ctx) => WritingActivityScreen(),
          FlipHomePage.routeName: (ctx) => FlipHomePage(),
          FlipCardLevelScreen.routeName: (ctx) => FlipCardLevelScreen(),
          GamesDisplay.routeName: (ctx) => GamesDisplay(),
          LetterRecognitionGame.routeName: (ctx) => LetterRecognitionGame(),
          ParentsGuidance.routeName: (ctx) => ParentsGuidance(),
          ParentsGuidance2.routeName: (ctx) => ParentsGuidance2(),
          ParentsGuidance1.routeName: (ctx) => ParentsGuidance1(),
          NewsHome.routeName: (ctx) => NewsHome(),
          ActivityProgressDetail.routeName: (ctx) => ActivityProgressDetail(),
          GameProgressDetail.routeName: (ctx) => GameProgressDetail(),


        });
  }
}
