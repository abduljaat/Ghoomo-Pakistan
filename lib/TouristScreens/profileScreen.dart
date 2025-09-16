import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/constants.dart';

class profileScreen extends StatefulWidget {
  var uid;
  profileScreen({
   required this.uid,
});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(8, 50, 8, 20),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.topLeft,
              child: Text(
                "User Profile",
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
                        margin: EdgeInsets.fromLTRB(8, 40, 8, 0),
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Column(
                          children: [

                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
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
                                              leading: Icon(
                                                Icons.person,
                                                color: green,
                                              ),
                                              title: Text("User Name"),
                                              subtitle: Text(
                                                  "${snapshot.data.docs[0]['TouristName']}"),
                                            ),
                                            Divider(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              height: 1,
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                Icons.mail,
                                                color: green,
                                              ),
                                              title:
                                              Text("User Email Address"),
                                              subtitle: Text(
                                                  "${snapshot.data.docs[0]['TouristEmail']}"),
                                            ),
                                            Divider(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              height: 1,
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                Icons.phone,
                                                color: green,
                                              ),
                                              title: Text("User Number"),
                                              subtitle: Text(
                                                  "${snapshot.data.docs[0]['TouristNumber']}"),
                                            ),
                                            Divider(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              height: 1,
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                Icons.location_city,
                                                color: green,
                                              ),
                                              title:
                                              Text("User City"),
                                              subtitle: Text(
                                                  "${snapshot.data.docs[0]['TouristCity']}"),
                                            ),
                                            Divider(color: Theme.of(context)
                                                .primaryColor,
                                              height: 1,),
                                            ListTile(
                                              leading: Icon(
                                                Icons.merge_type,
                                                color: green,
                                              ),
                                              title:
                                              Text("User Account Type"),
                                              subtitle: Text(
                                                  "${snapshot.data.docs[0]['AccountType']} Account"),
                                            ),

                                          ],
                                        ),
                                      ),
                                      clipper: ShapeBorderClipper(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(3))),
                                    ),
                                  ),
                                  // Card(
                                  //   child: Container(
                                  //     alignment: Alignment.topLeft,
                                  //     padding: EdgeInsets.all(15),
                                  //     child: Column(
                                  //       children: <Widget>[
                                  //         Column(
                                  //           children: <Widget>[
                                  //             ...ListTile.divideTiles(
                                  //               color: Colors.grey,
                                  //               tiles: [
                                  //                 ListTile(
                                  //                   contentPadding: EdgeInsets.symmetric(
                                  //                       horizontal: 12, vertical: 4),
                                  //                   leading: Icon(Icons.my_location),
                                  //                   title: Text("Location"),
                                  //                   subtitle: Text("USA"),
                                  //                 ),
                                  //                 ListTile(
                                  //                   leading: Icon(Icons.email),
                                  //                   title: Text("Email"),
                                  //                   subtitle:
                                  //                   Text("donaldtrump@gmail.com"),
                                  //                 ),
                                  //                 ListTile(
                                  //                   leading: Icon(Icons.phone),
                                  //                   title: Text("Phone"),
                                  //                   subtitle: Text("99--99876-56"),
                                  //                 ),
                                  //                 ListTile(
                                  //                   leading: Icon(Icons.person),
                                  //                   title: Text("About Me"),
                                  //                   subtitle: Text(
                                  //                       "This is a about me link and you can khow about me in this section."),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ],
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // )
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
