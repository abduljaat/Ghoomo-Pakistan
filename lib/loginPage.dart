import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ghoomo_pakistan/CarDriverScreens/CarDriverMainMenu.dart';
import 'package:ghoomo_pakistan/HotelScreens/HotelMainMenu.dart';
import 'package:ghoomo_pakistan/TourGuiderScreens/TourGuiderMainMenu.dart';
import 'package:ghoomo_pakistan/TouristScreens/TouristMainMenu.dart';
import 'package:ghoomo_pakistan/adminScreens/adminSplashScreen.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:ghoomo_pakistan/forgotPasswordPage.dart';
import 'package:ghoomo_pakistan/signupScreen.dart';
import 'package:ghoomo_pakistan/theme_helper.dart';
import 'package:hexcolor/hexcolor.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  var emailid, password;
  var email = "fa19bscs044@gmail.com";
  var loading = false;

  bool _passwordVisible = false;


  Future<Position> getUserCurrentLocation() async{
    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: "Map Error: ${error}");
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserCurrentLocation().then((value) {
      Fluttertoast.showToast(msg: "Location Accessed");
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: "Location Access Denied");
      SystemNavigator.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/bg.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(color: green.withOpacity(0.8),),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        children: [
                          SizedBox(height: size.height/7,),
                          Image.asset('assets/images/logo.png',width: 110, height: 110,),
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              color: yellow,
                                fontFamily: "mainTextStyle",
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Login to your Account',
                            style: TextStyle(fontFamily: "mainTextStyle",color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          SizedBox(height: 30.0),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Container(
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (val) {
                                        emailid = val;
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Email can't be empty";
                                        } else if (!RegExp(
                                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                            .hasMatch(val)) {
                                          return "Enter a valid email address";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person_outline_outlined, color: green,),
                                        labelText: "Email Address",
                                        hintText: "Enter your email address",
                                        hintStyle: TextStyle(
                                            color: Colors.grey
                                        ),
                                        labelStyle: TextStyle(
                                            color: Colors.black,
                                            backgroundColor: Colors.white
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: yellow,width: 2)),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                      ),
                                    ),
                                    decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                  ),
                                  SizedBox(height: 30.0),
                                  Container(
                                    child: TextFormField(
                                      onChanged: (val) {
                                        password = val;
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter your password";
                                        }
                                        else {
                                          return null;
                                        }

                                      },
                                      obscureText: !_passwordVisible,

                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock, color: green,),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: green,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            setState(() {
                                              _passwordVisible = !_passwordVisible;
                                            });
                                          },
                                        ),
                                        labelText: "Password",
                                        hintText: "Enter your password",
                                        hintStyle: TextStyle(
                                          color: Colors.grey
                                        ),
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          backgroundColor: Colors.white
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: yellow,width: 2)),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                      ),
                                    ),
                                    decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                  ),
                                  SizedBox(height: 15.0),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  forgotPasswordPage()),
                                        );
                                      },
                                      child: Text(
                                        "Forgot your password?",
                                        style: TextStyle(
                                          fontFamily: "mainTextStyle",

                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0),
                                          ),
                                        ),
                                        minimumSize: MaterialStateProperty.all(Size(50, 50)),
                                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      ),
                                      child: Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                        child: loading
                                            ? CircularProgressIndicator(color: green,)
                                            : Text(
                                          'Sign In'.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      onPressed: loading
                                          ? null
                                          : () {
                                        if (_formKey.currentState!
                                            .validate())
                                          {
                                            loading = !loading;
                                            setState(() {

                                            });
                                            signIn(
                                                emailid, password);
                                          }
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                    //child: Text('Don\'t have an account? Create'),
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(text: "Don\'t have an account? ", style: TextStyle(color: Colors.white, fontFamily: "mainTextStyle")),
                                      TextSpan(
                                        text: 'Sign up here',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        signupScreen()));
                                          },
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: yellow),
                                      ),
                                    ])),
                                  ),
                                  SizedBox(height: 20,),
                                  GestureDetector(
                                    onPanUpdate: (details) {
                                      // Swiping in right direction.
                                      int sensitivity = 8;
                                      if (details.delta.dx > sensitivity) {
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) {
                                            return adminSplashScreen();
                                          },
                                        ));
                                      }
                                      // Swiping in left direction.
                                      if (details.delta.dx < 0) {}
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty.all(Size(50, 50)),
                                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                            shadowColor: MaterialStateProperty.all(Colors.transparent),
                                          ),
                                          child: Padding(
                                              padding:
                                              EdgeInsets.fromLTRB(15, 10, 15, 10),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.arrow_forward,  color: Colors.black,),
                                                  Text(
                                                    'Swipe Right for Admin Access'
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              )
                                          ),
                                          onPressed: null),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('UserData')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('AccountType') == "Tourist") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  TouristMainMenu(index: 0,uid: user.uid),
            ),
          );
        }
        else if(documentSnapshot.get('AccountType') == "Tour Guider")
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return TourGuiderMainMenu(uid: user.uid);
            },));
          }
        else if(documentSnapshot.get('AccountType') == "Car Driver")
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CarDriverMainMenu(uid: user.uid),));
          }

        else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  HotelMainMenu(uid: user.uid),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          loading = !loading;
          setState(() {

          });
          Fluttertoast.showToast(msg: 'No User Found');
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          loading = !loading;
          setState(() {

          });
          Fluttertoast.showToast(msg: 'No user found for that email');
        }
      }
    }
  }
}
