import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/constants.dart';

class hotelDataShow extends StatefulWidget {


  @override
  State<hotelDataShow> createState() => _hotelDataShowState();
}

class _hotelDataShowState extends State<hotelDataShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text("Hotels"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10,top: 5),
          margin: EdgeInsets.only(left: 10, right: 10,top: 5),
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
                        return Table(
                          children: [
                            TableRow(
                              children: [
                                Text("SrNo#", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                Text("Hotel Names", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                Text("Contact#", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              ]
                            ),
                            TableRow(
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.black))
                                ),
                              children: [
                                Text('${index+1}'),
                                Text("${snapshot.data.docs[index]['HotelName']}"),
                                Text("${snapshot.data.docs[index]['HotelNumber']}"),
                              ]
                            ),

                          ],
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
      ),
    );
  }
  getDataUser() async {
    var result = await FirebaseFirestore.instance
        .collection("UserData")
        .where("AccountType", isEqualTo: 'Hotel')
        .where('status', isEqualTo: 'varified')
        .get();
    setState(() {});
    return result;
  }
}

