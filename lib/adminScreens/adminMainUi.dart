import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/adminScreens/adminCarRequestShow.dart';
import 'package:ghoomo_pakistan/adminScreens/adminGuiderRequestShow.dart';
import 'package:ghoomo_pakistan/adminScreens/adminHotelRequestShow.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:ghoomo_pakistan/theme_helper.dart';

class adminMainUi extends StatefulWidget {
  const adminMainUi({Key? key}) : super(key: key);

  @override
  State<adminMainUi> createState() => _adminMainUiState();
}

class _adminMainUiState extends State<adminMainUi> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        automaticallyImplyLeading: false,
        title: Text("Admin Pannel",
            style: TextStyle(color: Colors.white, fontFamily: 'mainTextStyle')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: (){
                auth.signOut();
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  Icon(Icons.directions_run, color: Colors.white,),
                  Text("Log Out", style: TextStyle(
                      color: Colors.white, fontFamily: 'mainTextStyle'))
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  margin: EdgeInsets.fromLTRB(
                      10, 0, 10, 10), // This will be the login form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold, fontFamily: 'mainTextStyle'),
                      ),
                      Text(
                        'Good to see you "Admin"!',
                        style: TextStyle(color: Colors.grey, fontFamily: 'mainTextStyle'),
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height/7,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          adminGuiderRequestShow(),
                                    ));
                              },
                              child: Container(
                                decoration: ThemeHelper()
                                    .buttonBoxDecoration(context),
                                height: size.height / 10,
                                width: size.width / 1.5,
                                child: Center(
                                  child: Text(
                                    "Tour Guider Requests",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight:
                                        FontWeight.bold, fontFamily: 'mainTextStyle'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    adminCarRequestShow(),
                                  ));
                            },
                            child: Container(
                              decoration: ThemeHelper()
                                  .buttonBoxDecoration(context),
                              height: size.height / 10,
                              width: size.width / 1.5,
                              child: Center(
                                child: Text(
                                  "Rent a Car Request",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight:
                                      FontWeight.bold, fontFamily: 'mainTextStyle'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    adminHotelRequestShow(),
                                  ));
                            },
                            child: Container(
                              decoration: ThemeHelper()
                                  .buttonBoxDecoration(context),
                              height: size.height / 10,
                              width: size.width / 1.5,
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Hotel Request",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight:
                                      FontWeight.bold, fontFamily: 'mainTextStyle'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 65.0,
        width: 65.0,
        child: FloatingActionButton(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Logout",style: TextStyle( fontFamily: 'mainTextStyle'),),
              Icon(Icons.directions_run),
            ],
          ),
          onPressed: () {
            auth.signOut();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
