import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appxx/config/palette.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'login_signup.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Palette.backgroundColor,
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assent/fo1.png"), fit: BoxFit.fill)),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(),
                ),
                // Trick to add the shadow for the submit button
                buildBottomHalfContainer(true),
                //Main Contianer for Login and Signup
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.bounceInOut,
                  top: 200,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 700),
                    curve: Curves.bounceInOut,
                    height: 580,
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width - 40,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        //      image: AssetImage("assent/fo1.png")),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(120),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 5),
                        ]),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "نسيت كلمة المرور",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.activeColor),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.purpleAccent,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          buildSignupSection(),
                        ],
                      ),
                    ),
                  ),
                ),
                // Trick to add the submit button
                buildBottomHalfContainer(false),
                // Bottom buttons
              ],
            ),
          ),
        ));
  }

  Container buildSignupSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "ادخل عنون البريد الالكتروني المرتبط بحسابك ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "سوف نرسل لك رمز التحقق الى حسابك لتاكيد الملكية",
                      style: TextStyle(color: Colors.grey[800], fontSize: 20),
                    ),
                  ]),
            ),
          ),
          buildTextField(
              MaterialCommunityIcons.email_outline, "الايميل", false, true),
          SizedBox(height: 30.0),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: " تذكرت كلمة المرور؟  ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextSpan(
                text: 'دخول',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginSignupScreen()));
                  },
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purpleAccent),
              ),
            ]),
          )
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: 635,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 80,
          width: 200,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blueGrey[200], Colors.blueGrey[400]],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: Container(
                      padding: EdgeInsets.only(right: 55, top: 10),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          " ارسال",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      )),
                )
              : Center(),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String labelText, bool isPassword, bool isEmail) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(bottom: 8)),
        Column(
          children: [
            Container(
              height: 70,
              width: 450,
              padding: EdgeInsets.all(15),
              child: Container(
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    icon: Icon(
                      icon,
                      color: Colors.blueAccent,
                    ),
                    labelText: labelText,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1.5,
                      blurRadius: 10,
                    )
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
