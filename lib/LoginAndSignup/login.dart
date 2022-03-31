// ignore_for_file: dead_code, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

//import 'package:lop/auth/userControler.dart';
//import 'package:lop/provider_all/SignUpProvider.dart';
import 'package:dyslexiaa/activity_screen.dart';
import 'package:dyslexiaa/dashboard.dart';
import 'package:dyslexiaa/first_onboarding.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:flutter_signin_button/button_builder.dart';
//import 'package:lop/provider_all/locator.dart';

import 'signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const routeName = "/login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;

  Map<String, String> _authData2 = {
    'email': '',
    'password': '',
  };

  bool _obscureText =
      true; // declare this variable for hiding the password with icon
  Future<void> _submit2() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    await locator.get<UserController>().signIn(
          _authData2['email'].toString(),
          _authData2['password'].toString(),
        );
    setState(() {
      _isLoading = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(height: 100), //use for spacing or create a gap
            Center(
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 40, color: Colors.black, fontFamily: "Lexend"),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        label: Text("Email"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData2['email'] = value!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          //here weuse setstate for changing the visibility of password
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                              validator:
                              (value) {
                                if (value.isEmpty) {
                                  return "* Required";
                                } else if (value.length < 6) {
                                  return "Password should be atleast 6 characters";
                                } else if (value.length > 15) {
                                  return "Password should not be greater than 15 characters";
                                } else
                                  return null;
                              };
                            });
                          },
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        hintText: 'Enter Password',
                        label: Text("Password"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onSaved: (value) {
                      _authData2['password'] = value!;
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_isLoading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _submit2,
                child: Text("Log In"),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(108, 202, 244, 1),
                    side: BorderSide(
                        width: 6, color: Color.fromRGBO(108, 202, 244, 1)),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.fromLTRB(115, 20, 115, 20)),
              ),

            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 67),
              child: Row(
                children: [
                  Text(
                    " Don't have an account?",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    // add this gesturedetector for linking login screen with a signup screen
                    onTap: () {
                      Navigator.pushNamed(context, Signup.routeName);
                    },
                    child: Text(
                      "Signup",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //],
            //),
            //),
          ]),
        ),
      ),
    );
    // throw UnimplementedError();
  }
}
