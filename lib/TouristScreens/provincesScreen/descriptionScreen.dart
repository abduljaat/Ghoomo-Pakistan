import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/constants.dart';

class descriptionScreen extends StatefulWidget {
  var desc, veh1, veh2, veh3;
  descriptionScreen({
   required this.desc,
   required this.veh1,
   required this.veh2,
   required this.veh3
});

  @override
  State<descriptionScreen> createState() => _descriptionScreenState();
}

class _descriptionScreenState extends State<descriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.desc}',textAlign: TextAlign.justify,style: TextStyle(fontFamily: "mainTextStyle",),),
            SizedBox(height: 20,),
            Text('Accessible Vehicles',style: TextStyle(fontFamily: "mainTextStyle",fontWeight: FontWeight.bold, fontSize: 18),),
            SizedBox(height: 5,),
            Row(children: [
              Expanded(child: Container(
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(20)
                ),
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Center(child: Text('${widget.veh1}',style: TextStyle(fontFamily: "mainTextStyle",color: Colors.white),)),
                ),
              )),
              SizedBox(width: 5,),
              Expanded(child: Container(
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(20)
                ),
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Center(child: Text('${widget.veh2}',style: TextStyle(fontFamily: "mainTextStyle",color: Colors.white),)),
                ),
              )),
              SizedBox(width: 5,),
              Expanded(child: Container(
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(20)
                ),
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Center(child: Text('${widget.veh3}',style: TextStyle(fontFamily: "mainTextStyle",color: Colors.white),)),
                ),
              )),

            ],)
          ],
        ),
      ),
    );
  }
}
