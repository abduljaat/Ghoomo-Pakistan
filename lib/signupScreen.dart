import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:ghoomo_pakistan/theme_helper.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {

  var listForAccountType= ['Tourist', 'Tour Guider',  'Car Driver', 'Hotel'];
  var selectedValueForAccountType = "Tourist";

  var listForCity= [
    'Lahore',
    'Faisalabad',
    'Bahawalpur',
    'Sheikhupura',
    'Jhelum',
    'Karachi',
    'Hyderabad',
    'Sukkur',
    'Jamshoro',
    'Gwadar',
    'Sibi',
    'Quetta',
    'Chaman',
    'Ziarat',
    'Peshawar',
    'Abbottabad',
    'Naran',
    'Shogran',
    'Swat',
    'Islamabad City',
    'Gilgit Baltistan',
    'Azad Jammu and Kashmir'
  ];
  var selectedValueForCity = "Lahore";


  EmailOTP myauth = EmailOTP();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final _formKeyTourist = GlobalKey<FormState>();
  final _formKeyGuider = GlobalKey<FormState>();
  final _formKeyDriver = GlobalKey<FormState>();
  final _formKeyHotel = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();


  bool enableOTPScreen = false;
  var otpPin;

 var guiderPrice;
 var carRentPrice, carName;
 var hotelRentPrice, hotelName, hotelAddress;
  var name, emailid, password,number,city;
  var loading = false;
  var loadingg = false;
  bool _passwordVisible = false;
  bool _passwordVisible2 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: enableOTPScreen ? Form(
                  key: _formKeyOTP,
                  child: Column(
                    children: [
                      SizedBox(height: size.height/10,),
                      Text(
                        'Email Varification',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "mainTextStyle",
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'OTP is send in your ${emailid}, kindly verify your email',
                        style: TextStyle(fontFamily: "mainTextStyle",color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(height: 30.0),
                      SizedBox(height: 20,),
                      Container(
                      child: TextFormField(
                      decoration: ThemeHelper().textInputDecoration(
                      'OTP', 'Enter your six digit OTP'),
                      onChanged: (val) {
                      otpPin = val;
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      validator: (val) {
                      if (val!.isEmpty) {
                      return "Please enter your OTP";
                      } else if (val.length < 6) {
                      return "Incomplete OTP";
                      }
                      return null;
                      },
                      ),
                      decoration:
                      ThemeHelper().inputBoxDecorationShaddow(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration:
                        ThemeHelper().buttonBoxDecoration(context),
                        child: ElevatedButton(
                          style: ThemeHelper().buttonStyle(),
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: loadingg
                                ? CircularProgressIndicator()
                                : Text(
                              "Verify".toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: loadingg
                              ? null
                              : () async {
                            setState(() {

                            });
                            if (_formKeyOTP.currentState!.validate()) {
                              loadingg = !loadingg;
                              setState(() async {
                                if (await myauth.verifyOTP(
                                    otp: otpPin.toString())) {
                                  Get.snackbar(
                                    "Wait",
                                    "Please Wait for a moment",
                                    snackPosition:
                                    SnackPosition.BOTTOM,
                                    backgroundColor: Colors.black,
                                    colorText: Colors.white,
                                    animationDuration:
                                    Duration(seconds: 1),
                                    duration: Duration(seconds: 1),
                                  );
                                  auth
                                      .createUserWithEmailAndPassword(
                                      email: emailid,
                                      password: password)
                                      .then((val) {
                                    User? user = auth.currentUser;
                                    user!.uid;
                                    FirebaseFirestore.instance.collection('UserData').doc(user.uid).set({
                                      'AccountType' : selectedValueForAccountType,
                                      'TouristName' : name,
                                      'TouristEmail' : emailid,
                                      'TouristPassword' : password,
                                      'TouristNumber' : number,
                                      'TouristCity' : selectedValueForCity,
                                      'uid' : user.uid
                                    }).whenComplete(() {
                                      setState(() {
                                      });
                                      auth.signOut();
                                      loadingg = !loadingg;
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(msg: "Account Created Successfully", backgroundColor: Colors.white,textColor: green,toastLength: Toast.LENGTH_LONG );
                                    });
                                  }).onError((error, stackTrace) {
                                    auth.signOut();
                                    loadingg = !loadingg;
                                    Navigator.pop(context);
                                    Get.snackbar(
                                      "Error",
                                      "This email is already in our Record",
                                      snackPosition:
                                      SnackPosition.BOTTOM,
                                      backgroundColor:
                                      Colors.red.shade900,
                                      colorText: Colors.white,
                                      animationDuration:
                                      Duration(seconds: 2),
                                      duration: Duration(seconds: 5),
                                    );
                                  });
                                } else {
                                  loadingg = !loadingg;
                                  Get.snackbar(
                                    "Error",
                                    "Wrong OTP",
                                    snackPosition:
                                    SnackPosition.BOTTOM,
                                    backgroundColor:
                                    Colors.red.shade900,
                                    colorText: Colors.white,
                                    animationDuration:
                                    Duration(seconds: 2),
                                    duration: Duration(seconds: 2),
                                  );
                                }
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
                :

                Column(
                  children: [
                    SizedBox(height: size.height/10,),
                    Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "mainTextStyle",
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Signup to continue',
                      style: TextStyle(fontFamily: "mainTextStyle",color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(height: 30.0),
                    SizedBox(height: 20,),
                    Container(
                      child: DropdownButtonFormField(
                        value:
                        selectedValueForAccountType,
                        items: listForAccountType.map((e) {
                          return DropdownMenuItem(
                            child: Text(e,),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedValueForAccountType = val as String;
                          });
                          // print(selectedValueForDropDown);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.travel_explore,color: green),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      decoration:
                      ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                        selectedValueForAccountType == "Tourist"
                            ?Form(
                        key: _formKeyTourist,
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Container(
                              child: TextFormField(
                                // keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  name = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "required";
                                  } else if (val.length<3){
                                    return "Enter a valid name";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Name'),
                                  hintText: "Enter a name",
                                  labelStyle: TextStyle(
                                      color: Colors.black
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  emailid = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Email can't be empty";
                                  } else if (!RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                    return "Enter a valid email address";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Email'),
                                  hintText: "Enter an email address",
                                  labelStyle: TextStyle(
                                    color: Colors.black
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  password = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your password";
                                  }
                                  else {
                                    return null;
                                  }

                                },
                                obscureText: !_passwordVisible,

                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: green,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  labelText: "Password",
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  password = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your password";
                                  }
                                  else if(password != val)
                                    {
                                      return "Password not matched";
                                    }
                                  else {
                                    return null;
                                  }

                                },
                                obscureText: !_passwordVisible2,

                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: green,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible2 = !_passwordVisible2;
                                      });
                                    },
                                  ),
                                  labelText: "Confirm Password",
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (val) {
                                  number = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "required";
                                  }
                                  else if(number[0] != "0")
                                    {
                                      return "Incorrect Number";
                                    }
                                  else {
                                    return null;
                                  }

                                },
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  hintText: "Enter a number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: DropdownButtonFormField(
                                value:
                                selectedValueForCity,
                                items: listForCity.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e,style: TextStyle(fontSize: 12)),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    selectedValueForCity = val as String;
                                  });
                                  // print(selectedValueForDropDown);
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.place,color: green),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),




                            SizedBox(height: 30.0),
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
                                  child: loading
                                      ? CircularProgressIndicator(color: green,)
                                      : Text(
                                    'Sign up'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                onPressed: loading
                                    ? null
                                    : () async {
                                  loading = !loading;
                                  setState(() {

                                  });
                                  if (_formKeyTourist.currentState!
                                      .validate())
                                  {
                                    myauth.setConfig(
                                        appEmail:
                                        "fa19bscs044@gmail.com",
                                        appName: "Ghoomo Pakistan",
                                        userEmail: emailid,
                                        otpLength: 6,
                                        otpType: OTPType.digitsOnly);
                                    if (await myauth.sendOTP() == true) {
                                      setState(() {
                                        enableOTPScreen =
                                        !enableOTPScreen;
                                      });
                                      Get.snackbar(
                                        "Successfull",
                                        "OTP has been sent",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                        Colors.green.shade900,
                                        colorText: Colors.white,
                                        animationDuration:
                                        Duration(seconds: 2),
                                        duration: Duration(seconds: 2),
                                      );
                                      loading = !loading;
                                    } else {
                                      setState(() {});
                                      loading = !loading;
                                      Get.snackbar(
                                        "Error",
                                        "OTP send fail",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                        Colors.red.shade900,
                                        colorText: Colors.white,
                                        animationDuration:
                                        Duration(seconds: 2),
                                        duration: Duration(seconds: 2),
                                      );
                                    }
                                  }
                                  else
                                  {
                                    setState(() {

                                    });
                                    loading = !loading;
                                    Fluttertoast.showToast(msg: "Enter all data", backgroundColor: Colors.red.shade900,textColor: Colors.white,toastLength: Toast.LENGTH_SHORT);
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(text: "Already have an account? ", style: TextStyle(color: Colors.black, fontFamily: "mainTextStyle")),
                                TextSpan(
                                  text: 'Login here',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                    Navigator.pop(context);
                                    },
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: green),
                                ),
                              ])),
                            ),
                          ],
                        ))
                        : selectedValueForAccountType == "Tour Guider"
                            ?Form(
                        key: _formKeyGuider,
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Container(
                              child: TextFormField(
                                // keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  name = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "required";
                                  } else if (val.length<3){
                                    return "Enter a valid name";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Name'),
                                  hintText: "Enter a name",
                                  labelStyle: TextStyle(
                                      color: Colors.black
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  emailid = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Email can't be empty";
                                  } else if (!RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                    return "Enter a valid email address";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Email'),
                                  hintText: "Enter an email address",
                                  labelStyle: TextStyle(
                                      color: Colors.black
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  password = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your password";
                                  }
                                  else {
                                    return null;
                                  }

                                },
                                obscureText: !_passwordVisible,

                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: green,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  labelText: "Password",
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  password = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your password";
                                  }
                                  else if(password != val)
                                  {
                                    return "Password not matched";
                                  }
                                  else {
                                    return null;
                                  }

                                },
                                obscureText: !_passwordVisible2,

                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: green,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible2 = !_passwordVisible2;
                                      });
                                    },
                                  ),
                                  labelText: "Confirm Password",
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (val) {
                                  number = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "required";
                                  }
                                  else if(number[0] != "0")
                                  {
                                    return "Incorrect Number";
                                  }
                                  else {
                                    return null;
                                  }

                                },
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  hintText: "Enter a number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: DropdownButtonFormField(
                                value:
                                selectedValueForCity,
                                items: listForCity.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e,style: TextStyle(fontSize: 12)),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    selectedValueForCity = val as String;
                                  });
                                  // print(selectedValueForDropDown);
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.place,color: green),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  guiderPrice = val;
                                },
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Tour Guider Price'),
                                  hintText: "Enter a per day price",
                                  labelStyle: TextStyle(
                                      color: Colors.black
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),




                            SizedBox(height: 30.0),
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
                                  child: loading
                                      ? CircularProgressIndicator(color: green,)
                                      : Text(
                                    'Sign up'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                onPressed: loading
                                    ? null
                                    : () {
                                  loading = !loading;
                                  setState(() {

                                  });
                                  if (_formKeyGuider.currentState!
                                      .validate())
                                  {
                                    auth.createUserWithEmailAndPassword(email: emailid, password: password).then((value) {
                                      FirebaseFirestore.instance.collection('Admin_Data').doc('O4zbcl3G8GeEr0Cp2Y3rIgZkVI83').collection('TourGuider_Request').doc(auth.currentUser!.uid).set({
                                        'GuiderName' : name,
                                        'GuiderEmail' : emailid,
                                        'AccountType' : selectedValueForAccountType,
                                        'GuiderPassword' : password,
                                        'GuiderNumber' : number,
                                        'GuiderCity' : selectedValueForCity,
                                        'GuiderPrice' : guiderPrice,
                                        'uid' : auth.currentUser!.uid,
                                        'status' : 'pending'
                                      }).whenComplete(() {
                                        auth.signOut();
                                        FirebaseFirestore.instance.collection("UserData").doc(auth.currentUser!.uid).set({
                                          'GuiderName' : name,
                                          'GuiderEmail' : emailid,
                                          'AccountType' : selectedValueForAccountType,
                                          'GuiderPassword' : password,
                                          'GuiderNumber' : number,
                                          'GuiderCity' : selectedValueForCity,
                                          'GuiderPrice' : guiderPrice,
                                          'uid' : auth.currentUser!.uid,
                                          'status' : 'pending'
                                        }).then((value) {
                                          setState(() {

                                          });
                                          loading = !loading;
                                          Navigator.pop(context);
                                          Fluttertoast.showToast(msg: "Request Send to ADMIN Successfully", backgroundColor: Colors.white,textColor: green,toastLength: Toast.LENGTH_LONG );

                                        });
                                         });

                                    }).onError((error, stackTrace) {
                                      loading = !loading;
                                      setState(() {
                                        Fluttertoast.showToast(msg: error.toString());
                                      });
                                    });

                                  }
                                  else
                                    {
                                      setState(() {

                                      });
                                      loading = !loading;
                                      Fluttertoast.showToast(msg: "Enter all data", backgroundColor: Colors.red.shade900,textColor: Colors.white,toastLength: Toast.LENGTH_SHORT);
                                    }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(text: "Already have an account? ", style: TextStyle(color: Colors.black, fontFamily: "mainTextStyle")),
                                TextSpan(
                                  text: 'Login here',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
                                    },
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: green),
                                ),
                              ])),
                            ),
                          ],
                        ))
                        : selectedValueForAccountType == "Car Driver"
                            ? Form(
                        key: _formKeyDriver,
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Container(
                              child: TextFormField(
                                // keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  name = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "required";
                                  } else if (val.length<3){
                                    return "Enter a valid name";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Name'),
                                  hintText: "Enter a name",
                                  labelStyle: TextStyle(
                                      color: Colors.black
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  emailid = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Email can't be empty";
                                  } else if (!RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                    return "Enter a valid email address";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Email'),
                                  hintText: "Enter an email address",
                                  labelStyle: TextStyle(
                                      color: Colors.black
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  password = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your password";
                                  }
                                  else {
                                    return null;
                                  }

                                },
                                obscureText: !_passwordVisible,

                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: green,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  labelText: "Password",
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  password = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your password";
                                  }
                                  else if(password != val)
                                  {
                                    return "Password not matched";
                                  }
                                  else {
                                    return null;
                                  }

                                },
                                obscureText: !_passwordVisible2,

                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: green,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible2 = !_passwordVisible2;
                                      });
                                    },
                                  ),
                                  labelText: "Confirm Password",
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (val) {
                                  number = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "required";
                                  }
                                  else if(number[0] != "0")
                                  {
                                    return "Incorrect Number";
                                  }
                                  else {
                                    return null;
                                  }

                                },
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  hintText: "Enter a number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              child: DropdownButtonFormField(
                                value:
                                selectedValueForCity,
                                items: listForCity.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e,style: TextStyle(fontSize: 12)),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    selectedValueForCity = val as String;
                                  });
                                  // print(selectedValueForDropDown);
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.place,color: green),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: TextFormField(
                                // keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  carName = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Car Model'),
                                  hintText: "Enter a car model",
                                  labelStyle: TextStyle(
                                      color: Colors.black
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: TextFormField(
                                // keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  carRentPrice = val;
                                },
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Car Rent'),
                                  hintText: "Enter a car rent price (perDay)",
                                  labelStyle: TextStyle(
                                      color: Colors.black
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              decoration:
                              ThemeHelper().inputBoxDecorationShaddow(),
                            ),



                            SizedBox(height: 30.0),
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
                                  child: loading
                                      ? CircularProgressIndicator(color: green,)
                                      : Text(
                                    'Sign up'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                onPressed: loading
                                    ? null
                                    : () {
                                  loading = !loading;
                                  setState(() {

                                  });
                                  if (_formKeyDriver.currentState!
                                      .validate())
                                  {
                                    auth.createUserWithEmailAndPassword(email: emailid, password: password).then((value) {
                                      FirebaseFirestore.instance.collection('Admin_Data').doc('O4zbcl3G8GeEr0Cp2Y3rIgZkVI83').collection('CarDriver_Request').doc(auth.currentUser!.uid).set({
                                        'CarDriverName' : name,
                                        'CarDriverEmail' : emailid,
                                        'AccountType' : selectedValueForAccountType,
                                        'CarDriverPassword' : password,
                                        'CarDriverNumber' : number,
                                        'CarDriverCity' : selectedValueForCity,
                                        'CarModel' : carName,
                                        'CarDriverRent' : carRentPrice,
                                        'uid' : auth.currentUser!.uid,
                                        'status' : 'pending'
                                      }).whenComplete(() {
                                        auth.signOut();
                                        FirebaseFirestore.instance.collection("UserData").doc(auth.currentUser!.uid).set({
                                          'CarDriverName' : name,
                                          'CarDriverEmail' : emailid,
                                          'AccountType' : selectedValueForAccountType,
                                          'CarDriverPassword' : password,
                                          'CarDriverNumber' : number,
                                          'CarDriverCity' : selectedValueForCity,
                                          'CarModel' : carName,
                                          'CarDriverRent' : carRentPrice,
                                          'uid' : auth.currentUser!.uid,
                                          'status' : 'pending'
                                        }).whenComplete(() {
                                          setState(() {

                                          });
                                          loading = !loading;
                                          Navigator.pop(context);
                                          Fluttertoast.showToast(msg: "Request Send to ADMIN Successfully", backgroundColor: Colors.white,textColor: green,toastLength: Toast.LENGTH_LONG );

                                        });
                                        });

                                    }).onError((error, stackTrace) {
                                      loading = !loading;
                                      setState(() {
                                        Fluttertoast.showToast(msg: error.toString());
                                      });
                                    });

                                  }
                                  else
                                  {
                                    setState(() {

                                    });
                                    loading = !loading;
                                    Fluttertoast.showToast(msg: "Enter all data", backgroundColor: Colors.red.shade900,textColor: Colors.white,toastLength: Toast.LENGTH_SHORT);
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(text: "Already have an account? ", style: TextStyle(color: Colors.black, fontFamily: "mainTextStyle")),
                                TextSpan(
                                  text: 'Login here',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
                                    },
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: green),
                                ),
                              ])),
                            ),
                          ],
                        ))
                            : Form(
                            key: _formKeyHotel,
                            child: Column(
                              children: [
                                SizedBox(height: 20,),
                                Container(
                                  child: TextFormField(
                                    // keyboardType: TextInputType.emailAddress,
                                    onChanged: (val) {
                                      hotelName = val;
                                    },
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "required";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      label: Text('Hotel Name'),
                                      hintText: "Enter a hotel name",
                                      labelStyle: TextStyle(
                                          color: Colors.black
                                      ),
                                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                                ),

                                SizedBox(height: 20,),
                                Container(
                                  child: TextFormField(
                                    // keyboardType: TextInputType.emailAddress,
                                    onChanged: (val) {
                                      hotelRentPrice = val;
                                    },
                                    keyboardType: TextInputType.number,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "required";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      label: Text('Hotel Room Rent'),
                                      hintText: "Enter a room rent (perDay)",
                                      labelStyle: TextStyle(
                                          color: Colors.black
                                      ),
                                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  child: TextFormField(
                                    // keyboardType: TextInputType.emailAddress,
                                    onChanged: (val) {
                                      hotelAddress = val;
                                    },
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "required";
                                      }
                                      return null;
                                    },
                                    maxLines: 2,
                                    maxLength: 60,
                                    decoration: InputDecoration(
                                      label: Text('Hotel Address'),
                                      hintText: "Enter a hotel address",
                                      labelStyle: TextStyle(
                                          color: Colors.black
                                      ),
                                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: green)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (val) {
                                      emailid = val;
                                    },
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Email can't be empty";
                                      } else if (!RegExp(
                                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                          .hasMatch(val)) {
                                        return "Enter a valid email address";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      label: Text('Email'),
                                      hintText: "Enter an email address",
                                      labelStyle: TextStyle(
                                          color: Colors.black
                                      ),
                                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    onChanged: (val) {
                                      password = val;
                                    },
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter your password";
                                      }
                                      else {
                                        return null;
                                      }

                                    },
                                    obscureText: !_passwordVisible,

                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: green,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible = !_passwordVisible;
                                          });
                                        },
                                      ),
                                      labelText: "Password",
                                      hintText: "Enter your password",
                                      hintStyle: TextStyle(
                                          color: Colors.grey
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    onChanged: (val) {
                                      password = val;
                                    },
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter your password";
                                      }
                                      else if(password != val)
                                      {
                                        return "Password not matched";
                                      }
                                      else {
                                        return null;
                                      }

                                    },
                                    obscureText: !_passwordVisible2,

                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible2
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: green,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible2 = !_passwordVisible2;
                                          });
                                        },
                                      ),
                                      labelText: "Confirm Password",
                                      hintText: "Enter your password",
                                      hintStyle: TextStyle(
                                          color: Colors.grey
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (val) {
                                      number = val;
                                    },
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "required";
                                      }
                                      else if(number[0] != "0")
                                      {
                                        return "Incorrect Number";
                                      }
                                      else {
                                        return null;
                                      }

                                    },
                                    decoration: InputDecoration(
                                      labelText: "Helpline Number",
                                      hintText: "Enter a helpline number",
                                      hintStyle: TextStyle(
                                          color: Colors.grey
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  child: DropdownButtonFormField(
                                    value:
                                    selectedValueForCity,
                                    items: listForCity.map((e) {
                                      return DropdownMenuItem(
                                        child: Text(e,style: TextStyle(fontSize: 12)),
                                        value: e,
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        selectedValueForCity = val as String;
                                      });
                                      // print(selectedValueForDropDown);
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.place,color: green),
                                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: green)),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                                ),



                                SizedBox(height: 30.0),
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
                                      child: loading
                                          ? CircularProgressIndicator(color: green,)
                                          : Text(
                                        'Sign up'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    onPressed: loading
                                        ? null
                                        : () {
                                      loading = !loading;
                                      setState(() {

                                      });
                                      if (_formKeyHotel.currentState!
                                          .validate())
                                      {
                                        auth.createUserWithEmailAndPassword(email: emailid, password: password).then((value) {
                                          FirebaseFirestore.instance.collection('Admin_Data').doc('O4zbcl3G8GeEr0Cp2Y3rIgZkVI83').collection('Hotel_Request').doc(auth.currentUser!.uid).set({
                                            'AccountType' : selectedValueForAccountType,
                                            'HotelName' : hotelName,
                                            'HotelRent' : hotelRentPrice,
                                            'HotelAddress' :hotelAddress,
                                            'HotelEmail' : emailid,
                                            'HotelPassword' : password,
                                            'HotelNumber' : number,
                                            'HotelCity' : selectedValueForCity,
                                            'uid' : auth.currentUser!.uid,
                                            'status' : 'pending'
                                          }).whenComplete(() {
                                            auth.signOut();
                                            FirebaseFirestore.instance.collection('UserData').doc(auth.currentUser!.uid).set({
                                              'AccountType' : selectedValueForAccountType,
                                              'HotelName' : hotelName,
                                              'HotelRent' : hotelRentPrice,
                                              'HotelAddress' :hotelAddress,
                                              'HotelEmail' : emailid,
                                              'HotelPassword' : password,
                                              'HotelNumber' : number,
                                              'HotelCity' : selectedValueForCity,
                                              'uid' : auth.currentUser!.uid,
                                              'status' : 'pending'
                                            }).whenComplete(() {
                                              setState(() {

                                              });
                                              loading = !loading;
                                              Navigator.pop(context);
                                              Fluttertoast.showToast(msg: "Request Send to ADMIN Successfully", backgroundColor: Colors.white,textColor: green,toastLength: Toast.LENGTH_LONG );

                                            });
                                             });

                                        }).onError((error, stackTrace) {
                                          loading = !loading;
                                          setState(() {
                                            Fluttertoast.showToast(msg: error.toString());
                                          });
                                        });

                                      }
                                      else
                                      {
                                        setState(() {

                                        });
                                        loading = !loading;
                                        Fluttertoast.showToast(msg: "Enter all data", backgroundColor: Colors.red.shade900,textColor: Colors.white,toastLength: Toast.LENGTH_SHORT);
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  //child: Text('Don\'t have an account? Create'),
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(text: "Already have an account? ", style: TextStyle(color: Colors.black, fontFamily: "mainTextStyle")),
                                    TextSpan(
                                      text: 'Login here',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pop(context);
                                        },
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: green),
                                    ),
                                  ])),
                                ),
                              ],
                            )) ,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
