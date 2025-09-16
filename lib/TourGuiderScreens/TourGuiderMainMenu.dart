import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:ghoomo_pakistan/loginPage.dart';

class TourGuiderMainMenu extends StatefulWidget {
  var uid;
  TourGuiderMainMenu({
   required this.uid
});

  @override
  State<TourGuiderMainMenu> createState() => _TourGuiderMainMenuState();
}

class _TourGuiderMainMenuState extends State<TourGuiderMainMenu> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                auth.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage(),));
              },
              child: Column(
                children: [
                  Icon(
                    Icons.directions_run,
                    color: Colors.white,
                  ),
                  Text("Log Out",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'mainTextStyle'))
                ],
              ),
            ),
          )
        ],
        title: Text("Tour Guider UI"),
        backgroundColor: green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                                              title: Text("Name"),
                                              subtitle: Text(
                                                  "${snapshot.data.docs[index]['name']}"),
                                            ),
                                            Divider(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              height: 1,
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                Icons.call,
                                                color: green,
                                              ),
                                              title:
                                              Text("Number"),
                                              subtitle: Text(
                                                  "${snapshot.data.docs[index]['number']}"),
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
                                              title: Text("City"),
                                              subtitle: Text(
                                                  "${snapshot.data.docs[index]['UserCity']}"),
                                            ),
                                            Divider(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              height: 1,
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
                            ),
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
            )
          ],
        ),
      ),
    );
  }
  getDataUser() async {
    var result = await FirebaseFirestore.instance
        .collection("TourGuiderReservation")
        .doc(widget.uid).collection('data')
        .get();
    return result;
  }
}
