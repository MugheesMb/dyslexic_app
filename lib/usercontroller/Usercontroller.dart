import 'dart:io';

import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/provider/authprovider.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/provider/storageRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class UserController {
  UserModel? _currentUser;
  authProvider authh = locator.get<authProvider>();
  final StorageRepo _storage = locator.get<StorageRepo>();
  User? user = FirebaseAuth.instance.currentUser;

  late Future init;
  UserController() {
    if (user != null) {
      init = initUser();
    }
  }

  Future<UserModel?> initUser() async {
    _currentUser = await authh.getUser();
    return _currentUser;
  }

  UserModel? get currentUser => _currentUser;

  Future<void> uploadProfilePicture(File image) async {
    _currentUser!.photoURL = await _storage.uploadFile(image);
  }

  Future<String?> getDownload() async {
    return await _storage.getUserProfileImage(currentUser!.id);
  }

  Future<bool> signIn(String email, String password, BuildContext context) async {
    _currentUser = await authh.signIn(email, password);
    if (_currentUser != null) {
      _currentUser!.photoURL = await getDownload();
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User document does not exist in Firestore. Please contact support."))
      );
      return false;
    }
  }
   
  UpdateFormData(String displayName) {
    _currentUser!.displayName = displayName;
    authh.UpdateFormData(displayName);
  }

  Future<bool> validateCurrentPassword(String password) async {
        return  authh.validatePassword(password);
  }

  void updateUserPassword(String newpassword) {
    authh.updateePassword(newpassword);
  }
}
