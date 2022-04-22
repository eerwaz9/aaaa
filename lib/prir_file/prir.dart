import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dark.dart';
import 'data.dart';
import 'home.dart';
import 'morning.dart';

class PrayTimes extends StatefulWidget {
  PrayTimes({Key key}) : super(key: key);

  @override
  _PrayTimesState createState() => _PrayTimesState();
}

class _PrayTimesState extends State<PrayTimes> {
  JsonConnection jsonConnection = new JsonConnection();
  Data list;

  static String city = 'Dammam';
  static String country = 'Saudi Arabia';
  static int method = 4;

  final String url =
      'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';

  Future getPTData() async {
    http.Response res = await http.get(Uri.encodeFull(url), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    final data = jsonDecode(res.body);

    list = Data.fromJson(data);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Center(
            child: Text(
          'مواقيت الصلاه حسب المنطقة الزمنية',
          style: TextStyle(fontSize: 30),
        )),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: jsonConnection.getPTLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: 10, left: 10, top: 10, bottom: 10),
                        ),
                        Card(
                            color: Colors.green[200],
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => morining()));
                              },
                              child: Container(
                                  padding: EdgeInsets.only(right: 15, left: 15),
                                  child: Text(
                                    "اذكار الصباح",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )),
                        Container(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Card(
                              color: Colors.green[200],
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => dark()));
                                },
                                child: Container(
                                    padding:
                                        EdgeInsets.only(right: 40, left: 20),
                                    child: Text(
                                      "اذكار المساء",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Card(
                              color: Colors.green[200],
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    padding:
                                        EdgeInsets.only(right: 30, left: 30),
                                    child: Text(
                                      "اذكار النوم",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )),
                        ),
                      ],
                    ),
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300.0),
                          image: DecorationImage(
                              image: AssetImage("image/fo0.png"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            snapshot.data.data.meta.timezone,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildBotparir(
                      snapshot.data.data.timings.fajr,
                      'الفجر',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    buildBotparir(
                      snapshot.data.data.timings.dhuhr,
                      'الضهر',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    buildBotparir(
                      snapshot.data.data.timings.asr,
                      'العصر',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    buildBotparir(snapshot.data.data.timings.maghrib, 'المغرب'),
                    SizedBox(
                      height: 15,
                    ),
                    buildBotparir(snapshot.data.data.timings.isha, 'العشاء'),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildBotparir(String text, String prir) {
    return Container(
      width: 550,
      height: 80,
      padding: EdgeInsets.only(left: 170),
      decoration: BoxDecoration(
          color: Colors.green[200], borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Text(
            (prir),
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              text,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
