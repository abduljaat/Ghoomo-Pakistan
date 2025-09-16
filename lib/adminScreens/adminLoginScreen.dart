import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ghoomo_pakistan/adminScreens/adminMainUi.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:ghoomo_pakistan/forgotPasswordPage.dart';
import 'package:ghoomo_pakistan/theme_helper.dart';

class adminLoginScreen extends StatefulWidget {
  const adminLoginScreen({Key? key}) : super(key: key);

  @override
  State<adminLoginScreen> createState() => _adminLoginScreenState();
}

class _adminLoginScreenState extends State<adminLoginScreen> {

  FirebaseAuth auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  var emailid, password;
  var email = "abdulrehmanflutter2@gmail.com";
  var loading = false;

  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/bg.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(color: green.withOpacity(0.8),),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        children: [
                          SizedBox(height: size.height/7,),
                          Image.asset('assets/images/logo.png',width: 110, height: 110,),
                          Text(
                            'Admin Pannel',
                            style: TextStyle(
                                color: yellow,
                                fontFamily: "mainTextStyle",
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Login to your Account',
                            style: TextStyle(fontFamily: "mainTextStyle",color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          SizedBox(height: 30.0),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
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
                                        prefixIcon: Icon(Icons.person_outline_outlined, color: green,),
                                        labelText: "Email Address",
                                        hintText: "Enter your email address",
                                        hintStyle: TextStyle(
                                            color: Colors.grey
                                        ),
                                        labelStyle: TextStyle(
                                            color: Colors.black,
                                            backgroundColor: Colors.white
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: yellow,width: 2)),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                      ),
                                    ),
                                    decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                  ),
                                  SizedBox(height: 30.0),
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
                                        prefixIcon: Icon(Icons.lock, color: green,),
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
                                            backgroundColor: Colors.white
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: yellow,width: 2)),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: green)),
                                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                      ),
                                    ),
                                    decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                  ),
                                  SizedBox(height: 15.0),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  forgotPasswordPage()),
                                        );
                                      },
                                      child: Text(
                                        "Forgot your password?",
                                        style: TextStyle(
                                          fontFamily: "mainTextStyle",

                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
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
                                            ? CircularProgressIndicator()
                                            : Text(
                                          'Sign In'.toUpperCase(),
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
                                        if (_formKey.currentState!
                                            .validate())
                                        {
                                          try {
                                            if (email == emailid)
                                            {
                                              auth
                                                  .signInWithEmailAndPassword(
                                                  email: emailid,
                                                  password: password)
                                                  .then(
                                                    (value) => Navigator
                                                    .pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        adminMainUi(),
                                                  ),
                                                ).then((value) =>
                                                    setState(() {
                                                      loading =
                                                      !loading;
                                                    })),
                                              )
                                                  .onError(
                                                      (error, stackTrace) {
                                                    setState(() {
                                                      loading = !loading;
                                                    });
                                                    Fluttertoast.showToast(
                                                        msg: error.toString());
                                                  });
                                            }

                                            else {
                                              setState(() {
                                                loading = !loading;
                                              });
                                              Get.snackbar(
                                                "Error",
                                                "No User",
                                                snackPosition:
                                                SnackPosition.BOTTOM,
                                                backgroundColor:
                                                Colors.red.shade900,
                                                colorText: Colors.white,
                                                animationDuration:
                                                Duration(seconds: 1),
                                                duration:
                                                Duration(seconds: 2),
                                              );
                                            }
                                          } on FirebaseAuthException catch (ex) {
                                            Get.snackbar(
                                              "Error",
                                              "${ex.toString()}",
                                              snackPosition:
                                              SnackPosition.BOTTOM,
                                              backgroundColor:
                                              Colors.red.shade900,
                                              colorText: Colors.white,
                                              animationDuration:
                                              Duration(seconds: 1),
                                              duration: Duration(seconds: 5),
                                            )
                                                .future
                                                .then((value) => setState(() {
                                              loading = !loading;
                                            }));
                                          }
                                        }
                                        else
                                          {
                                            loading = !loading;
                                            setState(() {

                                            });
                                          }
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
