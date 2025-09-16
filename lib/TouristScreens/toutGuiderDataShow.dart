import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/constants.dart';

class toutGuiderDataShow extends StatefulWidget {
  const toutGuiderDataShow({Key? key}) : super(key: key);

  @override
  State<toutGuiderDataShow> createState() => _toutGuiderDataShowState();
}

class _toutGuiderDataShowState extends State<toutGuiderDataShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text("Tour Guiders"),
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
                                  Text("${snapshot.data.docs[index]['GuiderName']}"),
                                  Text("${snapshot.data.docs[index]['GuiderNumber']}"),
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
        .where("AccountType", isEqualTo: 'Tour Guider')
        .where('status', isEqualTo: 'varified')
        .get();
    setState(() {});
    return result;
  }
}
