import 'dart:io';

import 'package:dyslexiaa/provider/authprovider.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageRepo {
  FirebaseStorage storage = FirebaseStorage.instance;
  authProvider signprovider = locator.get<authProvider>();

  Future<String> uploadFile(File file) async {
    var user = await signprovider.getUser();

    Reference reference = storage.ref().child("users/${user!.id}");
    final TaskSnapshot snapshot = await reference.putFile(file);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<dynamic> getUserProfileImage(String id) async {
       var user = await signprovider.getUser();
    try {
      Reference reference = storage.ref().child("users/${user!.id}");
      return await reference.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }
}
