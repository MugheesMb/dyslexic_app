//import 'dart:html';

import 'dart:io';

import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/profile/avatar.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Edit_Profile extends StatefulWidget {
  UserModel? user;
  Edit_Profile(this.user);

  @override
  State<Edit_Profile> createState() => Edit_ProfileState();
}

class Edit_ProfileState extends State<Edit_Profile> {
  final ImagePicker _picker = ImagePicker();
  File? photo;
  final _displayNam = TextEditingController();
  final _oldpassword = TextEditingController();
  final _newpassword = TextEditingController();
  final _confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool checkvalidpassword = true;
  @override
  void initState() {
    _displayNam.text = widget.user!.displayName;
   
    super.initState();
  }

  @override
  void dispose() {
    _displayNam.dispose();
    _oldpassword.dispose();
    _newpassword.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future<void> _submitedit() async {
      setState(() {
        _isLoading = true;
      });
       if (widget.user!.displayName != _displayNam.text) {
        var displayName = _displayNam.text;
        await locator.get<UserController>().UpdateFormData(displayName);
        Navigator.of(context).pop();
         Navigator.of(context).pop();
      }
      checkvalidpassword = await locator
          .get<UserController>()
          .validateCurrentPassword(_oldpassword.text);
      setState(() {
        _isLoading = false;
      });
       if (_formKey.currentState!.validate() && checkvalidpassword) {
        locator.get<UserController>().updateUserPassword(_newpassword.text);
        Navigator.pop(context);
      }
     
      
      
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff555555),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Avatar(
                avatarUrl: widget.user!.photoURL,
                onTap: () async {
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  photo = File(pickedFile!.path);
                  await locator
                      .get<UserController>()
                      .uploadProfilePicture(photo!);
                  setState(() {
                    //    print("Picture updated successfully.");
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                ),
                controller: _displayNam,
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "Manage Password",
                          style: TextStyle(
                            fontSize: 39,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          hintText: "password",
                          errorText: checkvalidpassword
                              ? null
                              : "please doucle check your current password",
                        ),
                        controller: _oldpassword,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password_outlined),
                          hintText: "New Password",
                        ),
                        controller: _newpassword,
                        obscureText: true,
                      ),
                      TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.password_sharp),
                            hintText: " Confirm New Password",
                          ),
                          obscureText: true,
                          controller: _confirmpassword,
                          validator: (value) {
                            return _newpassword.text == value
                                ? null
                                : "password didn't match";
                          }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: _submitedit,
                  color: Colors.black54,
                  child: const Center(
                    child: Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
