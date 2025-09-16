import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class mapScreen extends StatefulWidget {
  var lat, long;
  mapScreen({
   required this.lat,
   required this.long
});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Image.asset("assets/images/map.png"),
          Container(
            decoration: BoxDecoration(
              color: yellow,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(Size(50, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Padding(
                padding:
                EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  'get direction'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              onPressed:  () {
                launch('https://www.google.com/maps/search/?api=1&query=${widget.lat},${widget.long}');
              },
            ),
          ),
        ],
      ),
    );
  }
}
