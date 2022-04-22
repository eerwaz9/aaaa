import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_appxx/config/palette.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;

import '../home/Home.dart';
import '../prir_file/prir.dart';
import '../state_API/post_State_Api.dart';
import 'data_login_regester.dart';
import 'forgot_password_page.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  // bool _fetchDataphoneandpass=true;
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;
  String valuechoose;
  TextEditingController first_name = new TextEditingController();
  TextEditingController _laste_name = new TextEditingController();
  TextEditingController _canter = new TextEditingController();
  TextEditingController mobile_user = new TextEditingController();
  TextEditingController _number_card = new TextEditingController();
  TextEditingController password_user = new TextEditingController();
  void _Userapi() async {
    postState hg = new postState();
    bool isRegister = await hg.Userapi(
        first_name.value.text,
        _laste_name.text,
        _canter.text,
        mobile_user.text,
        double.parse(_number_card.text),
        password_user.text);
    if (isRegister == false) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.only(top: 20),
            backgroundColor: Colors.blue[100],
            title: Text(
              "هل تريد انشاء حساب",
              textAlign: TextAlign.right,
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Text(
                      "الغاء",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 150),
                    ),
                    Text(
                      "موافق",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("رقم الهاتف او كلمة المرور خطاء"),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "أعادة",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  List dataphone = [];
  List datapasse = [];
  void _fetchDataphoneandpass(String mobile_user, String password_user) async {
    var unencodedPath = "/Userapi/";
    Map<String, String> queryParameters = {
      "mobile_user": mobile_user,
      "password_user": password_user
    };
    String urls =
        "http://10.0.2.2:8000/Userapi/?mobile_user=$mobile_user&password_user=$password_user";
    print(urls);
    var url = Uri.http("10.0.2.2:8000", unencodedPath, queryParameters);
    List map = [];
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      dataphone = json.decode(response.body);
      print(dataphone);
      setState(() {
        dataphone = dataphone;
      });
    }
  }

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
                  padding: EdgeInsets.only(right: 60),
                  child: Text(
                    "تسجيل الدخول/انشاء الحساب ",
                    style: TextStyle(
                        fontSize: 25,
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
                      padding: EdgeInsets.only(right: 50, top: 20),
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
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assent/fo1.png"), fit: BoxFit.fill)),
              child: Stack(
                children: [
                  // Trick to add the shadow for the submit button
                  buildBottomHalfContainer(true),
                  //Main Contianer for Login and Signup
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 700),
                    curve: Curves.bounceInOut,
                    top: isSignupScreen ? 30 : 90,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 700),
                      curve: Curves.bounceInOut,
                      height: isSignupScreen ? 630 : 550,
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width - 40,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white54,
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
                                      isSignupScreen = false;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "تسجيل دخول",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: !isSignupScreen
                                                ? Palette.activeColor
                                                : Palette.iconColor),
                                      ),
                                      if (!isSignupScreen)
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          height: 2,
                                          width: 55,
                                          color: Colors.orange,
                                        )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSignupScreen = true;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "انشاء حساب",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: isSignupScreen
                                                ? Palette.activeColor
                                                : Palette.iconColor),
                                      ),
                                      if (isSignupScreen)
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          height: 2,
                                          width: 55,
                                          color: Colors.orange,
                                        )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            if (isSignupScreen) buildSignupSection(),
                            if (!isSignupScreen) buildSigninSection()
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Trick to add the submit button
                  buildBottomHalfContainer(false),
                  // Bottom buttons
                  Positioned(
                    top: MediaQuery.of(context).size.height - 180,
                    right: 0,
                    left: 0,
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            isSignupScreen
                                ? "انشاء حساب بواسطة"
                                : "تسجل الدخول بوسطة",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.white54),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildTextButton(MaterialCommunityIcons.facebook,
                                  "Facebook", Palette.facebookColor),
                              buildTextButton(
                                  MaterialCommunityIcons.google_plus,
                                  "Google",
                                  Palette.googleColor),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          Container(
            height: 170,
            width: 170,
            child: Icon(
              Icons.person,
              color: Colors.blue[300],
              size: 80,
            ),
            decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(300),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white60.withOpacity(.2),
                      spreadRadius: 8,
                      blurRadius: 20,
                      offset: Offset(1, 10))
                ]),
          ),
          buildPhone(mobile_user),
          buildlogin(MaterialCommunityIcons.lock_outline, "************ ", true,
              false, password_user, 'ادخل كلمة المرور'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text("تذكر كلمة المرور",
                      style: TextStyle(fontSize: 16, color: Colors.black))
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()));
                },
                child: Text("نسيت كلمة المرور؟",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            child: Icon(
              Icons.person_add,
              color: Colors.blue[300],
              size: 70,
            ),
            decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(300),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white60.withOpacity(.2),
                      spreadRadius: 8,
                      blurRadius: 20,
                      offset: Offset(1, 10))
                ]),
          ),
          buildregester(MaterialCommunityIcons.account_outline, "الاسم الاول ",
              false, false, first_name, 'ادخل اسم المستخدم الاول'),
          SizedBox(height: 15),
          buildregester(MaterialCommunityIcons.account_outline, "الاسم الاخير",
              false, false, _laste_name, 'ادخل اسم المستخدم الاخير'),
          SizedBox(height: 15),
          buildDrobdon(
            MaterialCommunityIcons.arrow_down_drop_circle,
            "الدولة",
          ),
          SizedBox(height: 15),
          buildPhone(mobile_user),
          SizedBox(height: 15),
          buildregester(MaterialCommunityIcons.card_bulleted, "رقم الهوية",
              false, false, _number_card, 'ادخل رقم الهوية'),
          SizedBox(height: 15),
          buildregester(MaterialCommunityIcons.lock_outline, "كلمة المرور ",
              true, false, password_user, 'ادخل كلمة المرور'),
          SizedBox(height: 15),
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
      top: isSignupScreen ? 630 : 620,
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
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: GestureDetector(
                    onTap: () async {
                      isSignupScreen
                          ? await _Userapi()
                          : await _fetchDataphoneandpass(
                              mobile_user.text, password_user.text);
                      print(dataphone);
                      if (mobile_user.value.text.length > 0 &&
                          password_user.text.length > 0) {
                        if (await dataphone[0]["mobile_user"] ==
                            mobile_user.value.text) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                insetPadding: EdgeInsets.only(top: 20),
                                backgroundColor: Colors.blue[100],
                                title: Text(
                                  "البيانات صحيحة",
                                  textAlign: TextAlign.right,
                                ),
                                actions: [
                                  RaisedButton(
                                    color: Colors.blue,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "الغاء",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 150),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home()));
                                          },
                                          child: Text(
                                            "موافق",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (await datapasse[0]["password_user"] ==
                            password_user.value.text) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                insetPadding: EdgeInsets.only(top: 20),
                                backgroundColor: Colors.blue[100],
                                title: Text(
                                  "ادخل رقم الهاتف",
                                  textAlign: TextAlign.right,
                                ),
                                actions: [
                                  RaisedButton(
                                    color: Colors.blue,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "اوافق",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 150),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else
                          () {
                            showDilaog("اوافق", context);
                          };
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.only(right: 50, top: 10),
                        child: Text(
                          isSignupScreen ? " انشاء حساب" : "تسجيل دخول",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              : Center(),
        ),
      ),
    );
  }

  Widget buildDrobdon(
    IconData icon,
    String hint,
  ) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 450,
          padding: EdgeInsets.only(top: 16, right: 40),
          child: Column(
            children: [
              DropdownButton(
                  hint: Text(hint),
                  dropdownColor: Colors.white54,
                  value: valuechoose,
                  icon: Icon(
                    icon,
                    color: Colors.blueAccent,
                  ),
                  iconSize: 22,
                  isExpanded: true,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  onChanged: (newvalue) {
                    setState(() {
                      valuechoose = newvalue;
                      _canter.text = valuechoose;
                    });
                  },
                  items: cantry.map((valueItum) {
                    return DropdownMenuItem(
                      value: valueItum,
                      child: GestureDetector(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 250,
                              ),
                              child: Text(
                                valueItum,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    );
                  }).toList()),
              // TextFormField(
              //   controller: controller,
              // ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  spreadRadius: 1.5,
                  blurRadius: 10,
                )
              ]),
        ),
      ],
    );
  }
}
