import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appxx/Request/request.dart';

import '../screen/login_signup.dart';

class mydrawar extends StatefulWidget {
  @override
  _mydrawarState createState() => _mydrawarState();
}

class _mydrawarState extends State<mydrawar> {
  bool isSignupScreen = false;

  int id;
  String name_door;
  String address_door;
  double Meridians_door;
  double latitudes_door;
  String image_door;
  double number_drivery;
  _mydrawarState({
    this.id,
    this.name_door,
    this.address_door,
    this.Meridians_door,
    this.latitudes_door,
    this.image_door,
    this.number_drivery,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assent/fo1.png"), fit: BoxFit.fill)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Drawer(
          backgroundColor: Colors.white54,
          child: ListView(
            children: [
              Container(
                  height: 250,
                  child: UserAccountsDrawerHeader(
                    accountName: Text(
                      "wazir almuliky",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    accountEmail: Text(
                      "wazeeralmuliky@gmail.com",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.deepPurple),
                    ),
                    currentAccountPicture: GestureDetector(
                      child: new CircleAvatar(
                        backgroundColor: Colors.black26,
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                    ), //يتم هنا تحديد لون الوجت
                  )),
              buildDrawar(Icons.home_sharp, "الصفحة الرئيسية", () {}),
              buildDrawar(Icons.history, "طلباتي", () {}),
              ExpansionTile(
                title: Container(
                  color: Colors.white54,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.red,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          " حـسـابي",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                children: [
                  buildDrawar(Icons.settings, "تغير الاعدادت الشخصية", () {}),
                  buildDrawar(Icons.lock_open, "تغير كلمة المرور", () {}),
                ],
              ),
              buildDrawar(Icons.chair, " طلب كرسي", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => isSignupScreen
                            ? request(
                                name_door: name_door,
                                image_door: image_door,
                              )
                            : request(
                                // image_door: "assent/f1.png",
                                name_door: " مكان المسجد",
                              )));
              }),
              buildDrawar(Icons.message, "من نحن", () {}),
              buildDrawar(Icons.phone, "تواصل معنا", () {}),
              buildDrawar(Icons.language, "اللغة", () {}),
              buildDrawar(Icons.logout, "تسجيل خروج", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginSignupScreen()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawar(IconData icon, String text, ontop) {
    return Container(
        color: Colors.white60,
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Column(children: [
          InkWell(
            onTap: ontop,
            child: ListTile(
              title: Text(
                text,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                icon,
                color: Colors.red,
                size: 27,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
        ]));
  }
}
