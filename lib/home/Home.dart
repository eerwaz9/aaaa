import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appxx/config/palette.dart';
import 'package:flutter_appxx/home/singlprodect.dart';
import 'package:http/http.dart' as http;

import '../drawar/mydrawar.dart';
import '../login_or_reguster_api/reguster_api.dart';
import '../prir_file/prir.dart';

class Home extends StatefulWidget {
  static const routeName = '/Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String valuechoose;
  bool isloding = false;
  List<Chair> chairs = [];
  Future<List<Chair>> getRequest() async {
    //replace your restFull API here.
    String url = "http://10.0.2.2:8000/Doorapi/";
    final response = await http.get(url);
    List responseData = json.decode(utf8.decode(response.bodyBytes));
    // if (chairs.length != null) {
    //   return chairs;
    //}
    if (response.statusCode == 200) {
      print("responseData");
      print(responseData);
      for (int i = 0; i < responseData.length; i++) {
        Chair chair = Chair(
          id: responseData[i]['id'],
          name_door: responseData[i]['name_door'],
          address_door: responseData[i]['address_door'],
          Meridians_door: responseData[i]['Meridians_door '],
          latitudes_door: responseData[i]['latitudes_door '],
          image_door: responseData[i]['image_door'],
          number_drivery: responseData[i]['number_drivery'],
          chiar_number: responseData[i]['chiar_number'],
        );

        print(chairs.length);
        //Adding user to the list.
        chairs.add(chair);
      }
      setState(() {
        chairs = chairs;
      });
    }
    return chairs;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest();
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
                  padding: EdgeInsets.only(
                    right: 150,
                  ),
                  child: Text(
                    "حجز الكرسي",
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
          drawer: mydrawar(),
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
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.bounceInOut,
                  top: 60,
                  width: 600,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 700),
                    curve: Curves.bounceInOut,
                    height: 700,
                    padding: EdgeInsets.all(20),
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
                          buildSignupSection(),
                        ],
                      ),
                    ),
                  ),
                ),

                // Trick to add the submit button

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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.7,
            child: isloding
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: chairs.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, index) {
                      return singalprodct(
                        name_door: chairs[index].name_door,
                        address_door: chairs[index].address_door,
                        image_door: chairs[index].image_door,
                        chiar_number: chairs[index].chiar_number,
                      );
                    },
                  ),
          ),
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

  Widget buildTextField(String labelText, IconData icon, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(bottom: 8)),
        Column(
          children: [
            Container(
              height: 70,
              width: 450,
              padding: EdgeInsets.all(15),
              child: Container(
                alignment: Alignment.center,
                child: TextField(
                  textDirection: TextDirection.rtl,
                  readOnly: true,
                  onTap: () {
                    setState(() {});
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    icon: Icon(
                      icon,
                      color: Colors.blueAccent,
                    ),
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

  Widget buildDrobdon(
    IconData icon,
    String hint,
    List list,
  ) {
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
                child: DropdownButton(
                    hint: Text(hint),
                    underline: SizedBox(),
                    dropdownColor: Colors.white54,
                    value: valuechoose,
                    icon: Icon(
                      icon,
                      color: Colors.blueAccent,
                      size: 40,
                    ),
                    iconSize: 22,
                    isExpanded: true,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    onChanged: (newvalue) {
                      setState(() {
                        valuechoose = newvalue;
                      });
                    },
                    items: list.map((valueItum) {
                      return DropdownMenuItem(
                        value: valueItum,
                        child: Text(
                          valueItum,
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                        alignment: Alignment.topRight,
                      );
                    }).toList()),
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
        ),
      ],
    );
  }
}
