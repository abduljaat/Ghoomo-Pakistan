import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/CarDriverScreens/CarDriverMainMenu.dart';
import 'package:ghoomo_pakistan/HotelScreens/HotelMainMenu.dart';
import 'package:ghoomo_pakistan/TourGuiderScreens/TourGuiderMainMenu.dart';
import 'package:ghoomo_pakistan/TouristScreens/TouristMainMenu.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:ghoomo_pakistan/loginPage.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    var emailid = "fa19bscs044@gmail.com";
    if (user != null && user.email.toString() != emailid) {
      Timer(Duration(milliseconds: 2000), () {
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
      });
    } else {
      Timer(const Duration(milliseconds: 2000), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => loginPage(),
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
              Text("GHOOMO", style: TextStyle(color: Colors.yellow, fontSize: 28, fontFamily: 'mainTextStyle',fontWeight: FontWeight.w500),),
              Text("PAKISTAN", style: TextStyle(color: Colors.white, fontSize: 32, fontFamily: 'mainTextStyle',fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
