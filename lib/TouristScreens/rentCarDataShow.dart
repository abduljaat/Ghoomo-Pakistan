import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/constants.dart';

class rentCarDataShow extends StatefulWidget {
  const rentCarDataShow({Key? key}) : super(key: key);

  @override
  State<rentCarDataShow> createState() => _rentCarDataShowState();
}

class _rentCarDataShowState extends State<rentCarDataShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text("Car Drivers"),
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
                                  Text("Names", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  Text("Contact#", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                ]
                            ),
                            TableRow(
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.black))
                                ),
                                children: [
                                  Text('${index+1}'),
                                  Text("${snapshot.data.docs[index]['CarDriverName']}"),
                                  Text("${snapshot.data.docs[index]['CarDriverNumber']}"),
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
        .where("AccountType", isEqualTo: 'Car Driver')
        .where('status', isEqualTo: 'varified')
        .get();
    setState(() {});
    return result;
  }
}
