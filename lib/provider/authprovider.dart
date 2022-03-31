import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dyslexiaa/LoginAndSignup/login.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class authProvider {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection('user');
  static UserModel? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
        id: map['id'],
        displayName: map['userName'],
        email: map['email'],
        photoURL: map['photoUrL'],
        createdAt: map['createdAt']);
  }

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  //SignUpProvider();
  Future<UserModel?> getUser() async {
    User? user2 = await auth.currentUser;
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('user')
        .doc(user2!.uid)
        .get();
    return authProvider.fromMap(userData.data() as Map<String, dynamic>);
  }

  // Future userSignedIn() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {

  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  // Future userSignedIn() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     DocumentSnapshot userData = await FirebaseFirestore.instance
  //         .collection('user')
  //         .doc(user.uid)
  //         .get();
  //     UserModel? userModel =
  //         UserModel.fromMap(userData.data() as Map<String, dynamic>);
  //     // print(userModel!.userName);
  //     return {userModel ,true} ;
  //   } else {
  //     return Login();
  //   }
  // }

  Future signup(String userName, String email, String password) async {
    var authResult = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    _currentUser = UserModel(
      id: authResult.user!.uid,
      displayName: userName,
      email: email,
      photoURL: authResult.user!.photoURL,
      createdAt: DateTime.now().toString(),
    );

    userCollectionRef.doc(_currentUser!.id).set(_currentUser!.toJson());

    return authResult.user != null;
  }

  Future<UserModel?> signIn(String email, String password) async {
    var authResult =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    return _currentUser = await getUser() as UserModel?;
  }

  Future UpdateFormData(String displayName) async {
    var user = await auth.currentUser;
    await userCollectionRef.doc(user!.uid).update({'userName': displayName});

    // _currentUser = await getUser(user.uid) as UserModel?;
    // print(currentUser!.userName);
    // signIn();
  }

  Future<bool> validatePassword(String password) async {
    var user = await auth.currentUser;
    var authCredentials = EmailAuthProvider.credential(
        email: user!.email ?? '', password: password);
    var authResult =
        await user.reauthenticateWithCredential(authCredentials);
    return authResult.user != null;
  }

  Future<void> updateePassword(String newpassword) async {
    var user = await auth.currentUser;
    user!.updatePassword(newpassword);
  }
   Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login()));
  
}
}
