import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/TouristScreens/hotelDataShow.dart';
import 'package:ghoomo_pakistan/TouristScreens/provincesScreen/ProvinceCitiesScreen.dart';
import 'package:ghoomo_pakistan/TouristScreens/rentCarDataShow.dart';
import 'package:ghoomo_pakistan/TouristScreens/toutGuiderDataShow.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:ghoomo_pakistan/theme_helper.dart';

class homeScreen extends StatefulWidget {
  var uid;
  homeScreen({
   required this.uid,
});

  @override
  State<homeScreen> createState() => _homeScreenState();
}


class _homeScreenState extends State<homeScreen> {
  var name, number,city;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 8,right: 8, top: 20),
        margin: EdgeInsets.only(left: 8,right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                      name = '${snapshot.data.docs[0]['TouristName']}';
                      number = '${snapshot.data.docs[0]['TouristNumber']}';
                      city = '${snapshot.data.docs[0]['TouristCity']}';
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Your City",style: TextStyle(
                                fontFamily: "mainTextStyle",),),
                              Text("${snapshot.data.docs[0]['TouristCity']}",style: TextStyle(fontSize: 20,fontFamily: "mainTextStyle",fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Text("Online", style: TextStyle(
                                  fontFamily: "mainTextStyle",fontSize: 16 ,color: Colors.white),),
                            ),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return SizedBox(
                    child: Center(child: LinearProgressIndicator(color: green,backgroundColor: yellow,)),
                  );
                }
              },
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius:
                      BorderRadius.all(Radius.circular(12)),
                    ),
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_city, size: 20,
                            color: Colors.white,
                          ),
                          Text("Provinces",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: "mainTextStyle",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black),
                      borderRadius:
                      BorderRadius.all(Radius.circular(12)),
                    ),
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.hotel ,size: 20, color: Colors.white,),
                          Text("Hotels",style: TextStyle(fontSize: 10,
                            fontFamily: "mainTextStyle",color: Colors.white,),),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => hotelDataShow(),));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black),
                      borderRadius:
                      BorderRadius.all(Radius.circular(12)),
                    ),
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.car_rental ,size: 20,color: Colors.white,),
                          Text("Rent Car",style: TextStyle(fontSize: 10,color: Colors.white,
                            fontFamily: "mainTextStyle",)),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => rentCarDataShow(),));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black),
                      borderRadius:
                      BorderRadius.all(Radius.circular(12)),
                    ),
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.travel_explore ,size: 20,color: Colors.white,),
                          Text("Tour Guider",style: TextStyle(fontSize: 10,color: Colors.white,
                            fontFamily: "mainTextStyle",)),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => toutGuiderDataShow(),));
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Text("Let's start your Journey together!", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: "mainTextStyle",
                color: Colors.black
            ),),
            SizedBox(height: 5,),
            Text("Choose Your Area", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "mainTextStyle",
              color: green
            ),),

            SizedBox(height: 20,),

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProvinceCitiesScreen(name: name,city: city,number: number,prov: 'punjab'),));
                    },
                    child: Container(
                      height: size.height/8.5,
                      width: size.width/2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage("assets/images/punjab.jpg"),fit: BoxFit.cover,opacity: 0.4 )
                      ),
                      child: Center(child: Text("PUNJAB",style: TextStyle(
                        fontFamily: "mainTextStyle",
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProvinceCitiesScreen(name: name,city: city,number: number,prov: 'sindh'),));
                    },
                    child: Container(
                      height: size.height/8.5,
                      width: size.width/2,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage("assets/images/sindh.jpg"),fit: BoxFit.cover,opacity: 0.4 )
                      ),
                      child: Center(child: Text("SINDH",style: TextStyle(
                          fontFamily: "mainTextStyle",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProvinceCitiesScreen(name: name,city: city,number: number,prov: 'balochistan'),));
                    },
                    child: Container(
                      height: size.height/8.5,
                      width: size.width/2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage("assets/images/Balochistan.jpg"),fit: BoxFit.cover,opacity: 0.4 )
                      ),
                      child: Center(child: Text("BALOCHISTAN",style: TextStyle(
                        fontFamily: "mainTextStyle",
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProvinceCitiesScreen(name: name,city: city,number: number,prov: 'kpk'),));
                    },
                    child: Container(
                      height: size.height/8.5,
                      width: size.width/2,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage("assets/images/kpk.jpg"),fit: BoxFit.cover,opacity: 0.4 )
                      ),
                      child: Center(child: Text("KPK",style: TextStyle(
                          fontFamily: "mainTextStyle",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 20,),

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProvinceCitiesScreen(name: name,city: city,number: number,prov: 'gilgit baltistan'),));
                    },
                    child: Container(
                      height: size.height/8.5,
                      width: size.width/2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage("assets/images/gilgit.jpg"),fit: BoxFit.cover,opacity: 0.4 )
                      ),
                      child: Center(child: Text("GILGIT BALTISTAN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontFamily: "mainTextStyle",
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProvinceCitiesScreen(name: name,city: city,number: number,prov: 'islamabad city'),));
                    },
                    child: Container(
                      height: size.height/8.5,
                      width: size.width/2,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage("assets/images/islamabad.jpg"),fit: BoxFit.cover,opacity: 0.4 )
                      ),
                      child: Center(child: Text("ISLAMABAD",style: TextStyle(
                          fontFamily: "mainTextStyle",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProvinceCitiesScreen(name: name,city: city,number: number,prov: 'ajk'),));
                    },
                    child: Container(
                      height: size.height/8.5,
                      width: size.width/2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage("assets/images/Kashmir.jpg"),fit: BoxFit.cover,opacity: 0.4 )
                      ),
                      child: Center(child: Text("AZAD JAMMU & KASHMIR",style: TextStyle(
                        fontFamily: "mainTextStyle",
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                ),
              ],
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
