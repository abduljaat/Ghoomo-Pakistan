import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/TouristScreens/TouristMainMenu.dart';
import 'package:ghoomo_pakistan/TouristScreens/hotelDataShow.dart';
import 'package:ghoomo_pakistan/TouristScreens/rentCarDataShow.dart';
import 'package:ghoomo_pakistan/TouristScreens/toutGuiderDataShow.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:ghoomo_pakistan/forgotPasswordPage.dart';
import 'package:ghoomo_pakistan/loginPage.dart';

class settingScreen extends StatefulWidget {
  var uid;
  settingScreen({
   required this.uid
});

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(8, 50, 8, 20),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            alignment: Alignment.topLeft,
            child: Text(
              "Settings",
              style: TextStyle(
                color: green,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "mainTextStyle"
              ),
              textAlign: TextAlign.left,
            ),
          ),
          FutureBuilder(
            future: getDataUser(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(parent: null),
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: green,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Center(
                                      child: Text(
                                        "${snapshot.data.docs[0]['TouristName'][0].toUpperCase()}",
                                        style: TextStyle(
                                            fontFamily: "mainTextStyle",
                                            fontSize: 34,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    )),
                                Text(
                                  "${snapshot.data.docs[0]['TouristName']} ",
                                  style: TextStyle(
                                      fontFamily: "mainTextStyle",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  child: ClipPath(
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: green,
                                              width: 5),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            dense: true,
                                            visualDensity: VisualDensity(
                                                vertical: -1),
                                            leading: Container(
                                              width: 28,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: green
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color:
                                                  Colors.white,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              "Profile",
                                              style:
                                              TextStyle(
                                                  fontFamily: "mainTextStyle",fontSize: 16),
                                            ),
                                            trailing: Icon(Icons
                                                .keyboard_arrow_right),
                                            onTap: () {
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TouristMainMenu(index: 1, uid: widget.uid),));
                                            },
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 60),
                                            child: Divider(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              height: 1,
                                            ),
                                          ),
                                          // ListTile(
                                          //   dense: true,
                                          //   visualDensity: VisualDensity(
                                          //       vertical: -1),
                                          //   leading: Container(
                                          //     width: 28,
                                          //     height: 25,
                                          //     decoration: BoxDecoration(
                                          //       shape: BoxShape.circle,
                                          //       color: green
                                          //     ),
                                          //     child: Center(
                                          //       child: Icon(
                                          //         Icons.update,
                                          //         color:
                                          //         Colors.white,
                                          //       ),
                                          //     ),
                                          //   ),
                                          //   trailing: Icon(Icons
                                          //       .keyboard_arrow_right),
                                          //   title: Text(
                                          //     "Update Profile",
                                          //     style:
                                          //     TextStyle(
                                          //         fontFamily: "mainTextStyle",fontSize: 16),
                                          //   ),
                                          //   onTap: () {
                                          //
                                          //   },
                                          // ),
                                          // Padding(
                                          //   padding:
                                          //   const EdgeInsets.only(
                                          //       left: 60),
                                          //   child: Divider(
                                          //     color: Theme.of(context)
                                          //         .primaryColor,
                                          //     height: 1,
                                          //   ),
                                          // ),
                                          ListTile(
                                            dense: true,
                                            visualDensity: VisualDensity(
                                                vertical: -1),
                                            leading: Container(
                                              width: 28,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: green
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.lock_reset,
                                                  color:
                                                  Colors.white,
                                                ),
                                              ),
                                            ),
                                            trailing: Icon(Icons
                                                .keyboard_arrow_right),
                                            title: Text(
                                              "Reset Password",
                                              style:
                                              TextStyle(
                                                  fontFamily: "mainTextStyle",fontSize: 16),
                                            ),
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => forgotPasswordPage(),));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                3))),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  child: ClipPath(
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: green,
                                              width: 5),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            dense: true,
                                            visualDensity: VisualDensity(
                                                vertical: -1),
                                            leading: Container(
                                              width: 28,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: green
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.hotel,
                                                  color:
                                                  Colors.white,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              "Hotels",
                                              style:
                                              TextStyle(
                                                  fontFamily: "mainTextStyle",fontSize: 16),
                                            ),
                                            trailing: Icon(Icons
                                                .keyboard_arrow_right),
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => hotelDataShow(),));
                                               },
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 60),
                                            child: Divider(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              height: 1,
                                            ),
                                          ),
                                          ListTile(
                                            dense: true,
                                            visualDensity: VisualDensity(
                                                vertical: -1),
                                            leading: Container(
                                              width: 28,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: green
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.travel_explore,
                                                  color:
                                                  Colors.white,
                                                ),
                                              ),
                                            ),
                                            trailing: Icon(Icons
                                                .keyboard_arrow_right),
                                            title: Text(
                                              "Tour Guider",
                                              style:
                                              TextStyle(
                                                  fontFamily: "mainTextStyle",fontSize: 16),
                                            ),
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => toutGuiderDataShow(),));
                                             },
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 60),
                                            child: Divider(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              height: 1,
                                            ),
                                          ),
                                          ListTile(
                                            dense: true,
                                            visualDensity: VisualDensity(
                                                vertical: -1),
                                            leading: Container(
                                              width: 28,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: green
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.car_rental,
                                                  color:
                                                  Colors.white,
                                                ),
                                              ),
                                            ),
                                            trailing: Icon(Icons
                                                .keyboard_arrow_right),
                                            title: Text(
                                              "Rent a Car",
                                              style:
                                              TextStyle(
                                                  fontFamily: "mainTextStyle",fontSize: 16),
                                            ),
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => rentCarDataShow(),));
                                             },
                                          ),

                                        ],
                                      ),
                                    ),
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                3))),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  child: ClipPath(
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: green,
                                              width: 5),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            dense: true,
                                            visualDensity: VisualDensity(
                                                vertical: -1),
                                            leading: Container(
                                              width: 28,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: green
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.logout,
                                                  color:
                                                  Colors.white,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              "Log Out",
                                              style:
                                              TextStyle(
                                                  fontFamily: "mainTextStyle",fontSize: 16),
                                            ),
                                            trailing: Icon(Icons
                                                .keyboard_arrow_right),
                                            onTap: () {
                                              auth.signOut();
                                              // Navigator.pop(context);
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage(),));
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                3))),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  getDataUser() async {
    var result = await FirebaseFirestore.instance
        .collection("UserData")
        .where("uid", isEqualTo: widget.uid)
        .get();
    return result;
  }
}
