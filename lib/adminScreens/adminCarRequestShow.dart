import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:quickalert/quickalert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class adminCarRequestShow extends StatefulWidget {
  const adminCarRequestShow({Key? key}) : super(key: key);

  @override
  State<adminCarRequestShow> createState() => _adminCarRequestShowState();
}

class _adminCarRequestShowState extends State<adminCarRequestShow> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        automaticallyImplyLeading: false,
        title: Text("Car Rent Request", style: TextStyle(color: Colors.white),),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if(snapshot.data.docs.length >= 1)
                    {
                      return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(parent: null),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print("CLICKED");
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: green.withOpacity(0.2),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(width: 1, color: green)),
                              width: size.width / 1.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Divider(color: Colors.white,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Car Driver Name", style: TextStyle(fontSize: 14),),
                                      Text("${snapshot.data.docs[index]['CarDriverName']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                      Text("Car Driver Email", style: TextStyle(fontSize: 14)),
                                      Text("${snapshot.data.docs[index]['CarDriverEmail']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                      Text("Car Driver City", style: TextStyle(fontSize: 14)),
                                      Text("${snapshot.data.docs[index]['CarDriverCity']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                      Text("Car Driver Number", style: TextStyle(fontSize: 14)),
                                      Text("${snapshot.data.docs[index]['CarDriverNumber']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                      Text("Car Model", style: TextStyle(fontSize: 14)),
                                      Text("${snapshot.data.docs[index]['CarModel']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),

                                      Text("Rent Per Day", style: TextStyle(fontSize: 14)),
                                      Text("Rs.${snapshot.data.docs[index]['CarDriverRent']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),




                                      Divider(color: Colors.white),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              dialNumber(
                                                  "${snapshot.data.docs[index]['CarDriverNumber']}");
                                              // print("${snapshot.data.docs[index]['ConstructorOwnerNumber']}");
                                            },
                                            icon: Icon(
                                              Icons.call,
                                              size: 26,
                                            ),
                                            color: Colors.green,
                                          ),
                                          IconButton(
                                              onPressed: () async {
                                                final link = WhatsAppUnilink(
                                                  phoneNumber:
                                                  '${snapshot.data.docs[index]['CarDriverNumber']}',
                                                  text: "",
                                                );
                                                await launch("$link");
                                              },
                                              icon: Icon(
                                                Icons.message,
                                                color: Colors.blue[900],
                                                size: 30,
                                              )),
                                        ],
                                      ),
                                      Divider(color: Colors.white,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              QuickAlert.show(
                                                  context: context,
                                                  type: QuickAlertType.confirm,
                                                  title: "Delete the Post?",
                                                  confirmBtnText: "Yes",
                                                  confirmBtnColor: Colors.red.shade900,
                                                  onConfirmBtnTap: () {
                                                    deleteFakePost(
                                                      '${snapshot.data.docs[index]['uid']}',);
                                                    Navigator.pop(context);
                                                  });
                                            },
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStatePropertyAll(Colors.red.shade900),
                                                shape: MaterialStatePropertyAll(StadiumBorder())
                                            ),
                                            child: Text("Fake Post" ,style: TextStyle(color: Colors.white),), ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                QuickAlert.show(
                                                    context: context,
                                                    type: QuickAlertType.confirm,
                                                    title: "Publish the Post?",
                                                    confirmBtnText: "Yes",
                                                    confirmBtnColor: Colors.green.shade900,
                                                    onConfirmBtnTap: () {
                                                      VerifiedPost(
                                                          '${snapshot.data.docs[index]['uid']}'
                                                      );
                                                      Navigator.pop(context);
                                                    });
                                              },
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStatePropertyAll(Colors.green.shade900),
                                                  shape: MaterialStatePropertyAll(StadiumBorder())
                                              ),
                                              child: Text("Publish Post", style: TextStyle(color: Colors.white),)),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    else
                    {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 50),
                                  width: size.width,
                                  child: Image.asset("assets/images/noRequest.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 250),
                                  child: Text("No Request",style: TextStyle(
                                      fontFamily: 'mainTextStyle',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20
                                  ),),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }

                  } else {
                    return SizedBox(
                      height: size.height,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getData() async {
    var result = await FirebaseFirestore.instance
        .collection("Admin_Data")
        .doc('O4zbcl3G8GeEr0Cp2Y3rIgZkVI83')
        .collection("CarDriver_Request")
        .get();
    setState(() {});
    return result;
  }
  dialNumber(String phoneNumber) async{
    var number = '${phoneNumber}'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    return res;
  }
  deleteFakePost(String uid) async {
    await FirebaseFirestore.instance
        .collection("Admin_Data")
        .doc('O4zbcl3G8GeEr0Cp2Y3rIgZkVI83')
        .collection("CarDriver_Request").doc(uid)
        .delete()
        .then((value)  {
      FirebaseFirestore.instance.collection("UserData").doc(uid).update({
        'uid' : ""
      }).then((value) {
        Fluttertoast.showToast(msg: "Data Deleted");
      });

    });
    setState(() {});
  }
  VerifiedPost(var uid)
  {
    FirebaseFirestore.instance.collection('UserData').doc(uid).update({
      'status' : 'varified'
    }).then((value) {
      FirebaseFirestore.instance
          .collection("Admin_Data")
          .doc('O4zbcl3G8GeEr0Cp2Y3rIgZkVI83')
          .collection("CarDriver_Request").doc(uid)
          .delete().then((value) {
        Fluttertoast.showToast(msg: "Post Varified");
      });
    });
    setState(() {

    });
  }
}
