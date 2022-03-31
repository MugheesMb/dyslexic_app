import 'dart:io';

import 'package:dyslexiaa/provider/authprovider.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


class StorageRepo {
  FirebaseStorage storage = FirebaseStorage.instance;
  authProvider signprovider = locator.get<authProvider>();

  Future<String> uploadFile(File file) async {
    var user = await signprovider.getUser();

    Reference reference = storage.ref().child("users/${user!.id}");
    final TaskSnapshot snapshot = await  reference.putFile(file);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

 Future<String> getUserProfileImage(String id) async {
    Reference reference = storage.ref().child("users/$id");
    return await reference.getDownloadURL();

  }
}
