import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appxx/Request/requeststate.dart';
import 'package:flutter_appxx/config/palette.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../login_or_reguster_api/reguster_api.dart';
import '../prir_file/prir.dart';
import '../screen/data_login_regester.dart';
import '../splash/datetime_picker_widget.dart';

class request extends StatefulWidget {
  int id;
  String name_door;
  String address_door;
  double Meridians_door;
  double latitudes_door;
  String image_door;
  double number_drivery;
  String chiar_number;
  request({
    this.id,
    this.name_door,
    this.address_door,
    this.Meridians_door,
    this.latitudes_door,
    this.image_door,
    this.number_drivery,
    this.chiar_number,
  });
  @override
  _requestState createState() => _requestState();
}

class _requestState extends State<request> {
  String valuechoose;
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = true;
  bool visubl = false;
  int add = 0;
  List<Chair> chairs = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white12,
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: 150,
                ),
                child: Text(
                  "طلب كرسي",
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
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  //    image: AssetImage(widget.prodect_image), fit: BoxFit.fill)),
                  image: AssetImage("assent/fo1.png"),
                  fit: BoxFit.fill)),
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
                top: 40,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.bounceInOut,
                  height: 750,
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
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
                              child: Column(
                                children: [
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
                        buildSignupSection(context),
                      ],
                    ),
                  ),
                ),
              ),
              // Trick to add the submit button
              buildBottomHalfContainer(false),
            ],
          ),
        ),
      ),
    );
  }

  Container buildSignupSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, right: 5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 90, left: 90, top: 90, bottom: 90),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      isSignupScreen ? widget.image_door : "لا يوجد طلب محدد "),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(70),
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Text(
            isSignupScreen ? widget.name_door : "",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconHeader_shoping(Colors.lightGreen, FontAwesomeIcons.minus,
                  (() async {
                setState(() {
                  if (add != 0) add -= 1;
                });
              })),
              Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  add.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25),
                ),
              ),
              iconHeader_shoping(Colors.lightGreen, FontAwesomeIcons.plus,
                  (() async {
                setState(() {
                  add += 1;
                });
              })),
            ],
          ),
          Container(
              padding: EdgeInsets.only(
                left: 100,
                top: 18,
              ),
              child: Row(
                children: [
                  Text(
                      isSignupScreen
                          ? "عدد الكراسي الفارغة في ${widget.name_door}"
                          : "عدد الكراسي الفارغة",
                      style: TextStyle(fontSize: 24, color: Colors.black)),
                  chairs == null || chairs.length <= 0
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Text(": ${widget.chiar_number.toString()}",
                          style: TextStyle(fontSize: 24, color: Colors.black)),
                ],
              )),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, top: 15),
                child: Checkbox(
                  value: visubl,
                  activeColor: Palette.textColor2,
                  onChanged: (value) {
                    setState(() {
                      visubl = !visubl;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text("مع السائق",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
              )
            ],
          ),
          isMalefamale(),
          DatetimePickerWidget(),
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

  Widget isMalefamale() {
    return Visibility(
      visible: visubl,
      child: Column(
        children: [
          Text(
            "تستطيع من هاذا القائمة تحديد نوع السائق حسب الإحتياج.....",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 150),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? Palette.textColor2
                                : Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Colors.transparent
                                    : Palette.textColor1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.person,
                          color: isMale ? Colors.white : Palette.iconColor,
                          size: 30,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8),
                        child: Text(
                          "ذكر",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? Colors.transparent
                                : Palette.textColor2,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Palette.textColor1
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: isMale ? Palette.iconColor : Colors.white,
                          size: 30,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8),
                        child: Text("انثى ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 700),
        curve: Curves.bounceInOut,
        top: 735,
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => requeststate()));
                          },
                          child: Text(
                            "طلب ",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        )),
                  )
                : Center(),
          ),
        ));
  }
}
//RaisedButten
