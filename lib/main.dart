import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ghoomo_pakistan/splashScreen.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});



  Color _primaryColor = HexColor('#194C26');
  Color _accentColor = HexColor('#2C8643');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'mainTextStyle',
        // primaryColor: _primaryColor,
        colorScheme: ColorScheme.light(
          primary: _primaryColor,  // Use _primaryColor as a regular Color
          secondary: _accentColor, // Accent color
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}

