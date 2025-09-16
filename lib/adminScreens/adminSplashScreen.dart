import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/adminScreens/adminLoginScreen.dart';
import 'package:ghoomo_pakistan/adminScreens/adminMainUi.dart';
import 'package:ghoomo_pakistan/constants.dart';

class adminSplashScreen extends StatefulWidget {
  const adminSplashScreen({Key? key}) : super(key: key);

  @override
  State<adminSplashScreen> createState() => _adminSplashScreenState();
}

class _adminSplashScreenState extends State<adminSplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    var emailid = "fa19bscs044@gmail.com";
    if (user != null && user.email.toString() == emailid) {
      Timer(Duration(milliseconds: 2000), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => adminMainUi(),
            ));
      });
    } else {
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => adminLoginScreen(),
          ));
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        margin: EdgeInsets.only(left: 8, right: 8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',width: 140, height: 140,),
              Text("GHOOMO PAKISTAN", style: TextStyle(color: Colors.yellow, fontSize: 28, fontFamily: 'mainTextStyle',fontWeight: FontWeight.w500),),
              Text("Admin Pannel", style: TextStyle(color: Colors.white, fontSize: 32, fontFamily: 'mainTextStyle',fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
