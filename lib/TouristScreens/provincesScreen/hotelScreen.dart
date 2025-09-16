import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ghoomo_pakistan/TouristScreens/provincesScreen/hotelScreen.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:quickalert/quickalert.dart';

class hotelScreen extends StatefulWidget {
  var name, number, userCity;
  var city;
  hotelScreen({
    required this.city,
    required this.name,
    required this.number,
    required this.userCity
  });

  @override
  State<hotelScreen> createState() => _hotelScreenState();
}

class _hotelScreenState extends State<hotelScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    return InkWell(
                      onTap: (){
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.confirm,
                            title: "Reserved?",
                            confirmBtnText: "Yes",
                            confirmBtnColor: Colors.green.shade900,
                            onConfirmBtnTap: () {
                              Fluttertoast.showToast(msg: "Please wait");
                              FirebaseFirestore.instance
                                  .collection('HotelReservation')
                                  .doc('${snapshot.data.docs[index]['uid']}')
                                  .collection('data')
                                  .add({
                                'name' : widget.name,
                                'number' : widget.number,
                                'UserCity' : widget.userCity
                              }).then((value) {
                                Fluttertoast.showToast(msg: "Reservation Done");
                                Navigator.pop(context);
                              });
                            });
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                              "Hotel Name: ${snapshot.data.docs[index]['HotelName']}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_city, color: green),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      '${snapshot.data.docs[index]['HotelCity']}')
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.pin_drop, color: green),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      '${snapshot.data.docs[index]['HotelAddress']}')
                                ],
                              ),


                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: green,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      '${snapshot.data.docs[index]['HotelNumber']}')
                                ],
                              ),
                              Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text(
                                    'Rs.${snapshot.data.docs[index]['HotelRent']} Per Day',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(fontSize: 16, color: green),
                                  )),
                            ],
                          ),
                        ),
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
        .where("AccountType", isEqualTo: 'Hotel')
        .where('HotelCity', isEqualTo: widget.city.toString())
        .where('status', isEqualTo: 'varified')
        .get();
    setState(() {});
    return result;
  }
}
