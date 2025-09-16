import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghoomo_pakistan/TouristScreens/favouriteScreen.dart';
import 'package:ghoomo_pakistan/TouristScreens/homeScreen.dart';
import 'package:ghoomo_pakistan/TouristScreens/profileScreen.dart';
import 'package:ghoomo_pakistan/TouristScreens/settingScreen.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:ghoomo_pakistan/loginPage.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
class TouristMainMenu extends StatefulWidget {
  var uid;
  var index;
  TouristMainMenu({
   required this.index,
    required this.uid
});

  @override
  State<TouristMainMenu> createState() => _TouristMainMenuState();
}

class _TouristMainMenuState extends State<TouristMainMenu> {

  late PageController pageController;


  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var screens = [
      homeScreen(uid: widget.uid),
      profileScreen(uid: widget.uid,),
      settingScreen(uid: widget.uid,)
    ];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body:  SafeArea(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              screens[widget.index],
            ],
          ),
        ),
        bottomNavigationBar: WaterDropNavBar(
          bottomPadding: 5,
          inactiveIconColor: Colors.grey,
          waterDropColor: green,
          backgroundColor: Colors.white,
          onItemSelected: (int index) {
            setState(() {
              widget.index = index;
            });

            pageController.animateToPage(widget.index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: widget.index,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.person,
              outlinedIcon: Icons.person_outline_outlined,
            ),
            BarItem(
              filledIcon: Icons.settings,
              outlinedIcon: Icons.settings_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
