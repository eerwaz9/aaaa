import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appxx/config/palette.dart';
import 'package:flutter_appxx/home/Home.dart';

import '../prir_file/prir.dart';

class requeststate extends StatefulWidget {
  @override
  _requeststateState createState() => _requeststateState();
}

class _requeststateState extends State<requeststate> {
  bool isSignupScreen = true;

  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white12,
            title: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: 150,
                  ),
                  child: Text(
                    "حالة الطلب",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PrayTimes()));
                  },
                  child: Container(
                      padding: EdgeInsets.only(right: 100, top: 20),
                      child: Text(
                        "مواقيت الصلاة",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
            centerTitle: true,
          ),
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
                  top: 100,
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
                                  setState(() {
                                    isSignupScreen = true;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "          ",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: isSignupScreen
                                              ? Palette.activeColor
                                              : Palette.textColor1),
                                    ),
                                    if (isSignupScreen)
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
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 310),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "رقم الطلب ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: " :25",
                      style: TextStyle(color: Colors.black, fontSize: 27),
                    ),
                  ]),
            ),
          ),
          SizedBox(height: 18.0),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 250),
                child: Text(
                  "هل تم ايصال الكرسي؟  ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Text(
                        "نعم",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 29,
                            color: Colors.pink),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "لا",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 29,
                            color: Colors.pink),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 380, bottom: 20),
                child: Text(
                  "نوع الطلب ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 220, bottom: 20),
                child: Text(
                  "عدد الكراسي التي تم طلبها: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 300),
                child: Text(
                  "وقت ارجاع الطلب : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
              ),
            ],
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
    return Container(
      padding: EdgeInsets.only(top: 520, left: 240),
      child: AnimatedPositioned(
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
                            colors: [
                              Colors.blueGrey[200],
                              Colors.blueGrey[400]
                            ],
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
      ),
    );
  }
}
