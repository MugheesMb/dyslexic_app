import 'package:dyslexiaa/dashboard.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


final FirebaseAuth auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  static const routeName = "/login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;

  final Map<String, String> _authData2 = {
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
    try {
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
    } on FirebaseAuthException catch (e) {
       setState(() {
        _isLoading = false;
      });
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
        
        );
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
        
        );
      } else {
        return print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                  height: size.height > 550
                      ? 100
                      : 10), //use for spacing or create a gap
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 40, color: Colors.black, fontFamily: "Lexend"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                  child: Text(
                " Add Your Details to login",
                style: TextStyle(fontSize: 20),
              )),
              SizedBox(
                height: size.height > 550 ? 60 : 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          label: const Text("Email"),
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
                    const SizedBox(
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
                                  } else {
                                    return null;
                                  }
                                };
                              });
                            },
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          hintText: 'Enter Password',
                          label: const Text("Password"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onSaved: (value) {
                        _authData2['password'] = value!;
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _submit2,
                  child: const Text("Log In"),
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(108, 202, 244, 1),
                      side: const BorderSide(
                          width: 6, color: Color.fromRGBO(108, 202, 244, 1)),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.fromLTRB(115, 20, 115, 20)),
                ),

              //PrimaryButton(buttonText: 'login'),
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    " Don't have an account?",
                    style: TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    // add this gesturedetector for linking login screen with a signup screen
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ));
                    },
                    child: const Text(
                      "Signup",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
    //throw UnimplementedError();
  }
}
