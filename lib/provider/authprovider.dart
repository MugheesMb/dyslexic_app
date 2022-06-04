import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dyslexiaa/LoginAndSignup/login.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authProvider {
  authProvider();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection('user');
  static UserModel? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
        id: map['id'],
        displayName: map['displayName'],
        email: map['email'],
        photoURL: map['photoURL'],
        createdAt: map['createdAt']);
  }

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  //SignUpProvider();
  Future<UserModel?> getUser() async {
    User? user2 = auth.currentUser;
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('user')
        .doc(user2!.uid)
        .get();
    return authProvider.fromMap(userData.data() as Map<String, dynamic>);
  }

  Future signup(String displayName, String email, String password) async {
    try {
      var authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _currentUser = UserModel(
        id: authResult.user!.uid,
        displayName: displayName,
        email: email,
        photoURL: authResult.user!.photoURL,
        createdAt: DateTime.now().toString(),
      );

      userCollectionRef.doc(_currentUser!.id).set(_currentUser!.toJson());

      return authResult.user != null;
    } catch (error) {
      rethrow;
    }
  }

  Future<UserModel?> signIn(String email, String password) async {
    try {
      var authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return _currentUser = await getUser();
    } catch (error) {
      rethrow;
    }
  }

  Future UpdateFormData(String displayName) async {
    var user = auth.currentUser;
    await userCollectionRef.doc(user!.uid).update({'displayName': displayName});
  }

  Future<bool> validatePassword(String password) async {
    var user = auth.currentUser;
    var authCredentials = EmailAuthProvider.credential(
        email: user!.email ?? '', password: password);
    try {
      var authResult = await user.reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> updateePassword(String newpassword) async {
    var user = auth.currentUser;
    user!.updatePassword(newpassword);
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}
