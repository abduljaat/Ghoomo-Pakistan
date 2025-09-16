import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/TouristScreens/provincesScreen/carRentScreen.dart';
import 'package:ghoomo_pakistan/TouristScreens/provincesScreen/descriptionScreen.dart';
import 'package:ghoomo_pakistan/TouristScreens/provincesScreen/hotelScreen.dart';
import 'package:ghoomo_pakistan/TouristScreens/provincesScreen/mapScreen.dart';
import 'package:ghoomo_pakistan/TouristScreens/provincesScreen/tourGuiderScreen.dart';
import 'package:ghoomo_pakistan/constants.dart';

class PunjabPlacesScreen extends StatefulWidget {
  var name, number,userCityy;
  var place;
  final String city, desc, img, veh1,veh2,veh3, lat,long;
  PunjabPlacesScreen({
   required this.place,
    required this.city,
    required this.lat,
    required this.long,
    required this.desc,
    required this.img,
    required this.veh1,
    required this.veh2,
    required this.veh3,
    required this.name,
    required this.number,
    required this.userCityy
});

  @override
  State<PunjabPlacesScreen> createState() => _PunjabPlacesScreenState();
}

class _PunjabPlacesScreenState extends State<PunjabPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: green,
            title: Text("${widget.place.toUpperCase()}"),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            margin: EdgeInsets.only(left: 10,right: 10),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Image.asset(widget.img ,fit: BoxFit.cover,height: 200,width: double.infinity,),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Container(
                    height: size.height / 22,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child:  TabBar(
                      indicator: BoxDecoration(
                          color: green,
                          borderRadius:  BorderRadius.circular(25.0),
                          border: Border.all(width: 1,color: Colors.black)
                      ) ,
                      labelColor: Colors.white,
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        Tab(
                          child: Text("Desc.",style: TextStyle(fontSize: 10,fontFamily: "mainTextStyle")),
                          // text: "Some Data",
                        ),
                        Tab(
                          child: Text("Map",style: TextStyle(fontSize: 10,fontFamily: "mainTextStyle")),
                        ),
                        Tab(
                          child: Text("Car",style: TextStyle(fontSize: 10,fontFamily: "mainTextStyle")),
                        ),
                        Tab(
                          child: Text("Guid",style: TextStyle(fontSize: 10,fontFamily: "mainTextStyle")),
                        ),
                        Tab(
                          child: Text("Hotel",style: TextStyle(fontSize: 10,fontFamily: "mainTextStyle")),
                        ),




                      ],
                    ),
                  ),
                ),

                Expanded(
                    child: TabBarView(
                      children:  [
                        descriptionScreen(desc: widget.desc, veh1: widget.veh1, veh2: widget.veh2, veh3: widget.veh3),
                        mapScreen(lat: widget.lat, long: widget.long),
                        carRentScreen(city: widget.city,number: widget.number,name: widget.name,userCity: widget.userCityy,),
                        tourGuiderScreen(city: widget.city,number: widget.number,name: widget.name,userCity: widget.userCityy,),
                        hotelScreen(city: widget.city,number: widget.number,name: widget.name,userCity: widget.userCityy,)

                        ],
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}
