import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../login_or_reguster_api/reguster_api.dart';

//Creating a class user to store the data;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Chair> chairs = [];
  Future<List<Chair>> getRequest() async {
    //replace your restFull API here.
    String url = "http://10.0.2.2:8000/chair/";
    final response = await http.get(url);
    List responseData = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      print("responseData");
      print(responseData);
      for (int i = 0; i < responseData.length; i++) {
        Chair chair = Chair(
          id: responseData[i]['id'],
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Http Get Request."),
          leading: Icon(
            Icons.get_app,
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: chairs == null || chairs.length <= 0
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(chairs[index].chiar_number.toString()),
                      ),
                    ),
                  )),

        // body: Container(
        //   padding: EdgeInsets.all(16.0),
        //   child: FutureBuilder(
        //     future: getRequest(),
        //     initialData: doors,
        //     builder: (BuildContext ctx, AsyncSnapshot snapshot) {
        //       print(snapshot.data);
        //       if (snapshot.data == null) {
        //         return Container(
        //           child: Center(
        //             child: CircularProgressIndicator(),
        //           ),
        //         );
        //       } else {
        //         return ListView.builder(
        //           itemCount: snapshot.data.length,
        //           itemBuilder: (ctx, index) => ListTile(
        //             title: Text(snapshot.data[index].name_door),
        //             subtitle: Text(snapshot.data[index].name_door),
        //             contentPadding: EdgeInsets.only(bottom: 20.0),
        //           ),
        //         );
        //       }
        //     },
        //   ),
        // ),
      ),
    );
  }
}
// // import 'dart:convert';
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// //
// // import '../login_or_reguster_api/reguster_api.dart';
// //
// // class news extends StatefulWidget {
// //   @override
// //   State<news> createState() => _newsState();
// // }
// //
// // class _newsState extends State<news> {
// //   Future<List<Doors>> getRequest() async {
// //     String url = "http://10.0.2.2:8000/Doorapi/";
// //     final response = await http.get(url);
// //     print(url);
// //     var responseData = json.decode(response.body);
// //
// //     //Creating a list to store input data;
// //
// //     List<Doors> doors = [];
// //     for (var doorsingl in responseData) {
// //       Doors door = Doors(
// //         id: doorsingl['id'],
// //         name_door: doorsingl['name_door'],
// //         address_door: doorsingl[' address_door'],
// //         Meridians_door: doorsingl['Meridians_door '],
// //         latitudes_door: doorsingl['latitudes_door '],
// //         image_door: doorsingl['image_door'],
// //         number_drivery: doorsingl['number_drivery'],
// //       );
// //       print(doors);
// //       //Adding user to the list.
// //       doors.add(door);
// //     }
// //     return doors;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text("Http Get Request."),
// //           leading: Icon(
// //             Icons.get_app,
// //           ),
// //         ),
// //         body: Container(
// //           padding: EdgeInsets.all(16.0),
// //           child: FutureBuilder(
// //             future: getRequest(),
// //             builder: (BuildContext ctx, AsyncSnapshot snapshot) {
// //               if (snapshot.data == null) {
// //                 return Container(
// //                   child: Center(
// //                     child: CircularProgressIndicator(),
// //                   ),
// //                 );
// //               } else {
// //                 return ListView.builder(
// //                   itemCount: snapshot.data.length,
// //                   itemBuilder: (ctx, index) => ListTile(
// //                     title: Text(snapshot.data[index].name_door),
// //                     subtitle: Text(snapshot.data[index].address_door),
// //                     contentPadding: EdgeInsets.only(bottom: 20.0),
// //                   ),
// //                 );
// //               }
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
