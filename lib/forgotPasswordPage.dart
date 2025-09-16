import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghoomo_pakistan/constants.dart';
import 'package:ghoomo_pakistan/theme_helper.dart';

class forgotPasswordPage extends StatefulWidget {
  const forgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<forgotPasswordPage> createState() => _forgotPasswordPageState();
}

class _forgotPasswordPageState extends State<forgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  var email;

  var loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/bg.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(color: green.withOpacity(0.8),),
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Forgot Password?',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: yellow
                                ),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10,),
                              Text('Enter the email address associated with your account.',
                                style: TextStyle(
                                  // fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10,),
                              Text('We will email you a verification code to check your authenticity.',
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontSize: 20,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: ThemeHelper().textInputDecoration("Email", "Enter your email"),
                                  onChanged: (val){
                                    email = val;
                                  },
                                  validator: (val){
                                    if(val!.isEmpty){
                                      return "Email can't be empty";
                                    }
                                    else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                      return "Enter a valid email address";
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 40.0),
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
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: loading ? CircularProgressIndicator() : Text(
                                      "Send".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onPressed: loading ? null : () {
                                    if(_formKey.currentState!.validate()) {
                                      setState(() {

                                      });
                                      loading = !loading;
                                      resetPassword().then((value) {
                                        loading = !loading;
                                        Navigator.pop(context);
                                      });
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "Remember your password? ", style: TextStyle(color: Colors.white)),
                                    TextSpan(
                                      text: 'Signin here',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pop(context);
                                        },
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        color: yellow
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.toString());
      Get.snackbar(
        "Successfull",
        "Reset password link send successfully\nCheck your SPAM folder",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade900,
        colorText: Colors.white,
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 5),
      );
      // .future.then((value) {
      //   setState(() {
      //     loading = !loading;
      //   });
      //   Navigator.pop(context);
      // });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade900,
        colorText: Colors.white,
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 5),
      );
      // .future.then((value) => setState(() {
      //   loading = !loading;
      // }));
      // // QuickAlert.show(
      // //     barrierDismissible: false,
      // //     context: context,
      // //     type: QuickAlertType.error,
      // //     text: e.toString(),
      // //     // title: "",
      // //     barrierColor: Colors.white.withOpacity(0.5),
      // //     borderRadius: 20,
      // //     animType: QuickAlertAnimType.slideInDown,
      // //     // autoCloseDuration: Duration(seconds: 4),
      // //     confirmBtnColor: Colors.red);
    }
  }
}
