import 'package:flutter/material.dart';

class ccc extends StatelessWidget {
  int id;
  String name_door;
  String address_door;
  String Meridians_door;
  String latitudes_door;
  String image_door;
  String number_drivery;

  ccc({
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
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Text(
                name_door,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue),
              )
            ],
          )),
    );
  }
}

// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
//
//
// class LogInScrean extends StatefulWidget {
//   @override
//   _LogInScreanState createState() => _LogInScreanState();
// }
//
// class _LogInScreanState extends State<LogInScrean> {
//   final EmileController = TextEditingController();
//   final PassowrdController = TextEditingController();
//   Color colorIcon = ColorAPP.lightGreen;
//   bool visablebassowrd = true;
//   Icon iconVisableandnonvisable = Icon(Icons.visibility);
//   bool checkforconvortImage = true;
//
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   List dataPhoneNo = [];
//   fetchDataPhoneNo(String PhoneNo) async {
//     var unencodedPath = "/api/loginWhithPhoneNoAPI/$PhoneNo/";
//     var url = Uri.http(PathAPI.PATH_MAIN_API, unencodedPath);
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       setState(() {
//         dataPhoneNo = json.decode(response.body);
//       });
//     }
//   }
//
//   List dataUserName = [];
//   fetchDataUserName(String UserName) async {
//     var unencodedPath = "/api/loginWhithUserNameAPI/$UserName/";
//     var url = Uri.http(PathAPI.PATH_MAIN_API, unencodedPath);
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       setState(() {
//         dataUserName = json.decode(response.body);
//       });
//     }
//   }
//
//   List dataEmile = [];
//   fetchDataEmile(String Emile) async {
//     var unencodedPath = "/api/loginWhithEmileAPI/$Emile/";
//     var url = Uri.http(PathAPI.PATH_MAIN_API, unencodedPath);
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       setState(() {
//         dataEmile = json.decode(response.body);
//       });
//     }
//   }
//
//   final _formKey = GlobalKey<FormState>();
//   bool isValidated = false;
//   @override
//   initState() {
//     super.initState();
//     DataUserLocal.addToRefrences();
//   }
//
//   var HaveAccount = false;
//   Widget build(BuildContext context) {
//     setState(() {
//       if (prefs != null) {
//         HaveAccount = prefs.getBool("HaveAccount");
//       }
//     });
//     setState(() {
//       if (prefs != null) {
//         HaveAccount = prefs.getBool("HaveAccount");
//       } else {
//         setState(() {});
//       }
//     });
//
//     return MaterialApp(
//       home: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//             body: InkWell(
//           highlightColor: ColorAPP.lightGreen,
//           child: Stack(
//             children: [
//               Container(
//                   decoration: BoxDecoration(
//                 color: ColorAPP.lightGreen,
//               )),
//               ButtonCreateAccountAndLoginInHead(
//                 isCreateAccount: false,
//                 onPreasCreateAccount: () {
//                   Navigator.of(context).pushReplacement(MaterialPageRoute(
//                       builder: (ctx) => ChoseCreateAccount()));
//                 },
//                 onPreasLogIn: () {},
//               ),
//               Container(
//                 child: Container(
//                   padding: EdgeInsets.only(top: 180),
//                   child: ListView(
//                     children: <Widget>[
//                       Container(
//                           height: MediaQuery.of(context).size.height / 1.3,
//                           decoration: BoxDecoration(
//                             gradient: RadialGradient(
//                               colors: [
//                                 ColorAPP.lightGreen.withOpacity(0.6),
//                                 ColorAPP.lightGreen.withOpacity(0.3),
//                                 ColorAPP.lightGreen.withOpacity(0.3),
//                                 ColorAPP.lightGreen.withOpacity(0.9),
//                                 ColorAPP.lightGreen.withOpacity(0.6),
//                                 ColorAPP.lightGreen.withOpacity(0.3),
//                                 Colors.white
//                               ],
//                               stops: [0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 10],
//                               center: Alignment(0.3, 0.5),
//                               focal: Alignment(0.9, 0.2),
//                               focalRadius: 5,
//                             ),
//
// /*
//
//                                   gradient: LinearGradient(
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter,
//
//                                       colors: [ Colors.white.withOpacity(0.6) ,
//                                         ColorAPP.lightGreen.withOpacity(0.6),
//
//                                         Colors.white.withOpacity(0.5) ,
//                                         Colors.white38,  ColorAPP.lightGreen.withOpacity(0.9),Colors.white, Colors.white,Colors.white ,Colors.white,  Colors.white,Colors.white ,Colors.white,Colors.white,Colors.white ,Colors.white,Colors.white, Colors.white,Colors.white, Colors.white,Colors.white,Colors.white, Colors.white]
//                                   ),
// */
//
//                             boxShadow: [
//                               new BoxShadow(
//                                 color: ColorAPP.lightGreen,
//                                 blurRadius: 300,
//                                 offset: Offset.infinite,
//                               ),
//                             ],
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(50.0),
//                                 topLeft: Radius.circular(50.0)),
//                           ),
//                           padding: EdgeInsets.only(
//                               bottom: 50, left: 10, right: 10, top: 30),
//                           child: Column(
//                             children: <Widget>[
//                               TextInputTextCard(
//                                 labelTxt: "??????????????",
//                                 hintTxt: "???????? ??????????????",
//                                 textinputaction: TextInputAction.done,
//                                 isPassword: false,
//                                 controller: this.EmileController,
//                                 iconsTextFild: Icon(
//                                   Icons.email,
//                                   color: colorIcon,
//                                 ),
//                                 textinputtype: TextInputType.text,
//                                 inputFormatter:
//                                     InputFormat.EmileinputFormatters,
//                               ),
//
//                               //
//                               // textFildPassBuildContainer("???????? ????????????"
//                               //     ,"???????? ???????? ????????????",
//                               //     TextInputType.visiblePassword,Icon(Icons.vpn_key,color:colorIcon)
//                               //     ,true,
//                               //     this.PassowrdController
//                               // ) ,
//
//                               TextInputTextCard(
//                                 labelTxt: "???????? ????????????",
//                                 hintTxt: "???????? ???????? ????????????",
//                                 textinputaction: TextInputAction.done,
//                                 isPassword: true,
//                                 controller: this.PassowrdController,
//                                 iconsTextFild: Icon(
//                                   Icons.vpn_key,
//                                   color: colorIcon,
//                                 ),
//                                 textinputtype: TextInputType.visiblePassword,
//                                 inputFormatter: [],
//                                 visablebassowrd: visablebassowrd,
//                                 suffixIcon: IconButton(
//                                     icon: iconVisableandnonvisable,
//                                     onPressed: () {
//                                       setState(() {
//                                         if (checkforconvortImage) {
//                                           visablebassowrd = false;
//                                           checkforconvortImage = false;
//                                           iconVisableandnonvisable = Icon(
//                                               Icons.visibility_off,
//                                               color: ColorAPP.lightGreen);
//                                         } else {
//                                           visablebassowrd = true;
//                                           checkforconvortImage = true;
//                                           iconVisableandnonvisable = Icon(
//                                             Icons.visibility,
//                                             color: ColorAPP.lightGreen,
//                                           );
//                                         }
//                                       });
//                                     }),
//                               ),
//
// /*
//
//                                     Form(
//                                         key: _formKey,
//                                         child: Column(children: <Widget>[
//                                           TextFormField(
//                                             onChanged: (input) {
//                                               _formKey.currentState.validate();
//                                             },
//                                             validator: (input) {
//                                               var regex = RegExp(
//                                                   r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//                                               if (!regex.hasMatch(input) && isValidated) {
//                                                 setState(() {
//                                                   isValidated = false;
//                                                 });
//                                                 return null;
//                                               } else {
//                                                 setState(() {
//                                                   isValidated = true;
//                                                 });
//                                                 return input;
//                                               }
//                                             },
//                                             decoration: InputDecoration(
//                                                 labelText: 'Enter your email'),
//                                           )])),
//
// */
//
//                               Container(
//                                 margin: EdgeInsets.all(15),
//
//                                 //width: MediaQuery.of(context).size.width,
//
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     new BoxShadow(
//                                       color: Colors.grey,
//                                       blurRadius: 100,
//                                       offset: Offset.lerp(
//                                           Offset.zero, Offset.infinite, 30),
//                                       //spreadRadius: 100000
//                                     ),
//                                   ],
//                                   color: ColorAPP.lightGreen,
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(50.0),
//                                       topLeft: Radius.circular(50.0),
//                                       bottomLeft: Radius.circular(50.0),
//                                       bottomRight: Radius.circular(50.0)),
//                                 ),
//
//                                 child: TextButton(
//                                   style: ButtonStyle(
//                                     overlayColor:
//                                         MaterialStateProperty.resolveWith<
//                                             Color>((Set<MaterialState> states) {
//                                       if (states
//                                           .contains(MaterialState.focused))
//                                         return Colors.red;
//                                       if (states
//                                           .contains(MaterialState.hovered))
//                                         return Colors.green;
//                                       if (states
//                                           .contains(MaterialState.pressed))
//                                         return ColorAPP.lightGreen;
//                                       return null; // Defer to the widget's default.
//                                     }),
//                                   ),
//                                   child: Center(
//                                     child: Row(
//                                       children: <Widget>[
//                                         new Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: MediaQuery.of(context)
//                                                         .size
//                                                         .height /
//                                                     10)),
//                                         Icon(
//                                           Icons.person,
//                                           color: Colors.white,
//                                         ),
//                                         new Padding(
//                                             padding: EdgeInsets.only(left: 10)),
//                                         Text(
//                                           "?????????? ????????",
//                                           style: TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.white),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   onPressed: () async {
//                                     Navigator.of(context).pushReplacement(
//                                         MaterialPageRoute(
//                                             builder: (ctx) =>
//                                                 ChooseSchoolScrean()));
//
//                                     String Message = " ";
//
//                                     if (EmileController.value.text.isNotEmpty ||
//                                         EmileController.value.text != null) {
//                                       //  SnackBarShow();
//
//                                       await fetchDataUserName(
//                                           EmileController.value.text);
//
//                                       var datenow = new DateTime.now();
//                                       if (await dataUserName.length > 0) {
//                                         print("1");
//                                         print(dataUserName[0]["password"]);
//                                         print(dataUserName[0]["UserName"]);
//                                         if (await dataUserName[0]["password"] ==
//                                             PassowrdController.value.text) {
//                                           print("???? ?????????? ????????????");
//                                           showInSnackBar(
//                                               "???? ?????????? ????????????", context);
//
//                                           await DB.deleteAll();
//
//                                           InLocaParent newUserDB =
//                                               new InLocaParent(
//                                             id: 1,
//                                             Full_Name: dataUserName[0]
//                                                 ["Full_Name"],
//                                             UserName: dataUserName[0]
//                                                 ["UserName"],
//                                             Email: dataUserName[0]["Email"],
//                                             password: dataUserName[0]
//                                                 ["password"],
//                                             isVerify: true,
//                                             IMEI_device: dataUserName[0]
//                                                 ["IMEI_device"],
//                                             keyVerify: dataUserName[0]
//                                                 ["keyVerify"],
//                                             PhoneNo: dataUserName[0]["PhoneNo"],
//                                             session_no: dataUserName[0]
//                                                 ["session_no"],
//                                             images_user: dataUserName[0]
//                                                 ["images_user"],
//                                             KeyActiveStatus: dataUserName[0]
//                                                 ["KeyActiveStatus"],
//                                             Data_Update: dataUserName[0]
//                                                 ["Date_Added"],
//                                             Date_Added: dataUserName[0]
//                                                 ["Date_Added"],
//                                           );
//
//                                           await DB.newUser(newUserDB);
//
//                                           await DataUserLocal.addToRefrences();
//                                           // Navigator.of(context).pushReplacement(
//                                           //     MaterialPageRoute(builder:
//                                           //         (ctx) => ProfilePage(
//                                           //
//                                           //     )));
//                                           //  Navigator.of(context).pushReplacement(
//                                           //      MaterialPageRoute(builder:
//                                           //          (ctx) => mainCityList(  )));
//
//                                         } else {
//                                           Message =
//                                               " ???? ???????????? ???????????? ?????????? ???? ???? ???????????? ????????????";
//                                           //  showInSnackBar(Message);
//                                           showInSnackBar(Message, context);
//                                         }
//                                       } else {
//                                         await fetchDataEmile(
//                                             EmileController.value.text);
//
//                                         if (await dataEmile.length > 0) {
//                                           print("2");
//                                           print(dataEmile[0]["password"]);
//                                           print(dataEmile[0]["UserName"]);
//                                           if (await dataEmile[0]["password"] ==
//                                               PassowrdController.value.text) {
//                                             await print("???? ?????????? ????????????");
//
//                                             await showInSnackBar(
//                                                 "???? ?????????? ????????????", context);
//
//                                             await DB.deleteAll();
//
//                                             InLocaParent newUserDB =
//                                                 new InLocaParent(
//                                                     id: 1,
//                                                     Full_Name: dataEmile[0]
//                                                         ["Full_Name"],
//                                                     UserName: dataEmile[0]
//                                                         ["UserName"],
//                                                     Email: dataEmile[0]
//                                                         ["Email"],
//                                                     password: dataEmile[0]
//                                                         ["password"],
//                                                     isVerify: true,
//                                                     IMEI_device: dataEmile[0]
//                                                         ["IMEI_device"],
//                                                     keyVerify: dataEmile[0]
//                                                         ["keyVerify"],
//                                                     PhoneNo: dataEmile[0]
//                                                         ["PhoneNo"],
//                                                     session_no: dataEmile[0]
//                                                         ["session_no"],
//                                                     images_user: dataEmile[0]
//                                                         ["images_user"],
//                                                     KeyActiveStatus:
//                                                         dataEmile[0]
//                                                             ["KeyActiveStatus"],
//                                                     Data_Update: dataEmile[0]
//                                                         ["Date_Added"],
//                                                     Date_Added: dataEmile[0]
//                                                         ["Date_Added"]);
//
//                                             await DB.newUser(newUserDB);
//
//                                             await DataUserLocal
//                                                 .addToRefrences();
//
//                                             // Navigator.of(context).pushReplacement(
//                                             // MaterialPageRoute(builder:
//                                             // (ctx) => mainCityList(
//                                             //
//                                             // )));
//                                           } else {
//                                             Message =
//                                                 " ???? ???????????? ???????????? ?????????? ???? ???? ???????????? ????????????";
//                                             //  showInSnackBar(Message);
//                                             showInSnackBar(Message, context);
//                                           }
//                                         } else {
//                                           await fetchDataPhoneNo(
//                                               EmileController.value.text);
//                                           if (await dataPhoneNo.length > 0) {
//                                             print("3");
//                                             print(dataPhoneNo[0]["password"]);
//                                             print(dataPhoneNo[0]["UserName"]);
//                                             if (await dataPhoneNo[0]
//                                                     ["password"] ==
//                                                 PassowrdController.value.text) {
//                                               await print("???? ?????????? ????????????");
//
//                                               await showInSnackBar(
//                                                   "???? ?????????? ????????????", context);
//
//                                               await DB.deleteAll();
//
//                                               InLocaParent newUserDB =
//                                                   new InLocaParent(
//                                                       id: 1,
//                                                       Full_Name: dataPhoneNo[0]
//                                                           ["Full_Name"],
//                                                       UserName: dataPhoneNo[0]
//                                                           ["UserName"],
//                                                       Email: dataPhoneNo[0]
//                                                           ["Email"],
//                                                       password: dataPhoneNo[0]
//                                                           ["password"],
//                                                       isVerify: true,
//                                                       IMEI_device:
//                                                           dataPhoneNo[0]
//                                                               ["IMEI_device"],
//                                                       keyVerify: dataPhoneNo[0]
//                                                           ["keyVerify"],
//                                                       PhoneNo: dataPhoneNo[0]
//                                                           ["PhoneNo"],
//                                                       session_no: dataPhoneNo[0]
//                                                           ["session_no"],
//                                                       images_user:
//                                                           dataPhoneNo[0]
//                                                               ["images_user"],
//                                                       KeyActiveStatus:
//                                                           dataPhoneNo[0][
//                                                               "KeyActiveStatus"],
//                                                       Data_Update: dataPhoneNo[
//                                                           0]["Date_Added"],
//                                                       Date_Added: dataPhoneNo[0]
//                                                           ["Date_Added"]);
//
//                                               await DB.newUser(newUserDB);
//
//                                               await DataUserLocal
//                                                   .addToRefrences();
//                                               // Navigator.of(context).pushReplacement(
//                                               //     MaterialPageRoute(builder:
//                                               //         (ctx) => mainCityList(
//                                               //
//                                               //     )));
//                                               //
//
//                                             } else {
//                                               Message =
//                                                   " ???? ???????????? ???????????? ?????????? ???? ???? ???????????? ????????????";
//                                               //  showInSnackBar(Message);
//                                               showInSnackBar(Message, context);
//                                             }
//                                           } else {
//                                             Message =
//                                                 " ???? ???????????? ???????????? ?????????? ???? ???? ???????????? ????????????";
//                                             //  showInSnackBar(Message);
//                                             showInSnackBar(Message, context);
//                                           }
//                                         }
//                                       }
//                                     } else {
//                                       Message = "???????? ?????????????? ";
//                                       //  showInSnackBar(Message);
//                                       showInSnackBar(Message, context);
//                                     }
//                                   },
//                                 ),
//                               ),
//                               Center(
//                                 child: FlatButton(
//                                   padding: EdgeInsets.only(
//                                       //  left: MediaQuery.of(context).size.height/7 ,
//                                       ),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//                                       Icon(
//                                         Icons.rotate_right,
//                                         color: ColorAPP.lightGreen,
//                                       ),
//                                       Text("     "),
//                                       Text(
//                                         "???? ???????? ???????? ???????? ??",
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             color: ColorAPP.lightGreen),
//                                       )
//                                     ],
//                                   ),
//                                   onPressed: () {
//                                     //
//                                     // Navigator.of(context)
//                                     //     .push(
//                                     //     MaterialPageRoute
//                                     //       (builder: (context) =>
//                                     //         EmailVerificationScreen(
//                                     //
//                                     //         )));
//                                   },
//                                 ),
//                               )
//                             ],
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
//
//   void showInSnackBar(String value, BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: const Icon(Icons.message),
//       duration: const Duration(seconds: 1),
//       action: SnackBarAction(
//         label: value,
//         onPressed: () {},
//       ),
//     ));
//   }
// }
//
// onPressed: ()
// async {
//
// Navigator.of(context).pushReplacement(
// MaterialPageRoute(builder:
// (ctx) => ChooseSchoolScrean(
//
// )));
//
// String Message=" ";
//
// if(EmileController.value.text.isNotEmpty || EmileController.value.text != null){
// //  SnackBarShow();
//
//
//
//
// await  fetchDataUserName(EmileController.value.text);
//
// var datenow=new DateTime.now();
// if( await dataUserName.length>0){
// print("1");
// print(dataUserName[0]["password"]);
// print(dataUserName[0]["UserName"]);
// if( await dataUserName[0]["password"] == PassowrdController.value.text){
// print("???? ?????????? ????????????");
// showInSnackBar("???? ?????????? ????????????",context);
//
//
// await  DB.deleteAll();
//
// InLocaParent newUserDB = new InLocaParent(
// id: 1,
// Full_Name: dataUserName[0]["Full_Name"],
// UserName:dataUserName[0]["UserName"],
// Email: dataUserName[0]["Email"],
// password: dataUserName[0]["password"],
// isVerify: true,
// IMEI_device: dataUserName[0]["IMEI_device"],
// keyVerify: dataUserName[0]["keyVerify"],
// PhoneNo:dataUserName[0]["PhoneNo"],
// session_no: dataUserName[0]["session_no"],
// images_user:  dataUserName[0]["images_user"],
// KeyActiveStatus: dataUserName[0]["KeyActiveStatus"],
// Data_Update: dataUserName[0]["Date_Added"],
// Date_Added:   dataUserName[0]["Date_Added"],
// );
//
// await  DB.newUser(newUserDB);
//
// await DataUserLocal.addToRefrences();
// // Navigator.of(context).pushReplacement(
// //     MaterialPageRoute(builder:
// //         (ctx) => ProfilePage(
// //
// //     )));
// //  Navigator.of(context).pushReplacement(
// //      MaterialPageRoute(builder:
// //          (ctx) => mainCityList(  )));
//
// }else{
// Message=" ???? ???????????? ???????????? ?????????? ???? ???? ???????????? ????????????";
// //  showInSnackBar(Message);
// showInSnackBar(Message,context);
// }
// }else{
// await  fetchDataEmile(EmileController.value.text);
// if(await dataEmile.length>0){
// print("2");
// print(dataEmile[0]["password"]);
// print(dataEmile[0]["UserName"]);
// if( await dataEmile[0]["password"] == PassowrdController.value.text){
// await print("???? ?????????? ????????????");
// await showInSnackBar("???? ?????????? ????????????",context);
// await  DB.deleteAll();
//
// InLocaParent newUserDB = new InLocaParent(
// id: 1,
// Full_Name: dataEmile[0]["Full_Name"],
// UserName:dataEmile[0]["UserName"],
// Email: dataEmile[0]["Email"],
// password: dataEmile[0]["password"],
// isVerify: true,
// IMEI_device: dataEmile[0]["IMEI_device"],
// keyVerify: dataEmile[0]["keyVerify"],
// PhoneNo:dataEmile[0]["PhoneNo"],
// session_no: dataEmile[0]["session_no"],
// images_user:  dataEmile[0]["images_user"],
// KeyActiveStatus: dataEmile[0]["KeyActiveStatus"],
// Data_Update: dataEmile[0]["Date_Added"],
// Date_Added:   dataEmile[0]["Date_Added"]
// );
// await  DB.newUser(newUserDB);
// await DataUserLocal.addToRefrences();
// }else{
// Message=" ???? ???????????? ???????????? ?????????? ???? ???? ???????????? ????????????";
// //  showInSnackBar(Message);
// showInSnackBar(Message,context);
// }
// }
//
//
// else{
// await  fetchDataPhoneNo(EmileController.value.text);
// if(await dataPhoneNo.length>0){
//
// print("3");
// print(dataPhoneNo[0]["password"]);
// print(dataPhoneNo[0]["UserName"]);
// if( await dataPhoneNo[0]["password"] == PassowrdController.value.text){
//
// await print("???? ?????????? ????????????");
// await showInSnackBar("???? ?????????? ????????????",context);
// await  DB.deleteAll();
// InLocaParent newUserDB = new InLocaParent(
// id: 1,
// Full_Name: dataPhoneNo[0]["Full_Name"],
// UserName:dataPhoneNo[0]["UserName"],
// Email: dataPhoneNo[0]["Email"],
// password: dataPhoneNo[0]["password"],
// isVerify:true,
// IMEI_device: dataPhoneNo[0]["IMEI_device"],
// keyVerify: dataPhoneNo[0]["keyVerify"],
// PhoneNo:dataPhoneNo[0]["PhoneNo"],
// session_no: dataPhoneNo[0]["session_no"],
// images_user:  dataPhoneNo[0]["images_user"],
// KeyActiveStatus: dataPhoneNo[0]["KeyActiveStatus"],
// Data_Update: dataPhoneNo[0]["Date_Added"],
// Date_Added:   dataPhoneNo[0]["Date_Added"]
// );
//
// await  DB.newUser(newUserDB);
//
//
// await DataUserLocal.addToRefrences();
// // Navigator.of(context).pushReplacement(
// //     MaterialPageRoute(builder:
// //         (ctx) => mainCityList(
// //
// //     )));
// //
//
//
// }else{
// Message=" ???? ???????????? ???????????? ?????????? ???? ???? ???????????? ????????????";
// //  showInSnackBar(Message);
// showInSnackBar(Message,context);
// }
// }else{
// Message=" ???? ???????????? ???????????? ?????????? ???? ???? ???????????? ????????????";
// //  showInSnackBar(Message);
// showInSnackBar(Message,context);
// }
// }
// }
//
// }else{
// Message="???????? ?????????????? ";
// //  showInSnackBar(Message);
// showInSnackBar(Message,context);
// }
// // },
// if (mobile_user.text.isNotEmpty &&
// password_user.text.isNotEmpty) {
// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// insetPadding: EdgeInsets.only(top: 20),
// backgroundColor: Colors.blue[100],
// title: Text(
// "???????????????? ??????????",
// textAlign: TextAlign.right,
// ),
// actions: [
// RaisedButton(
// color: Colors.blue,
// child: Row(
// children: [
// GestureDetector(
// onTap: () {
// Navigator.of(context).pop();
// },
// child: Text(
// "??????????",
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(right: 150),
// ),
// // if (mobile_user == !true &&
// //     password_user == true)
// GestureDetector(
// onTap: () {
// if (mobile_user.text.isNotEmpty &&
// password_user.text.isNotEmpty) {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// Home()));
// }
// },
// child: Text(
// "??????????",
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold),
// ),
// ),
// ],
// ),
// ),
// ],
// );
// },
// );
// } else if (mobile_user.text.isEmpty &&
// password_user.text.isNotEmpty) {
// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// insetPadding: EdgeInsets.only(top: 20),
// backgroundColor: Colors.blue[100],
// title: Text(
// "???????? ?????? ????????????",
// textAlign: TextAlign.right,
// ),
// actions: [
// RaisedButton(
// color: Colors.blue,
// child: Row(
// children: [
// GestureDetector(
// onTap: () {
// Navigator.of(context).pop();
// },
// child: Text(
// "??????????",
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(right: 150),
// ),
// ],
// ),
// ),
// ],
// );
// },
// );
// } else if (mobile_user.text.isNotEmpty &&
// password_user.text.isEmpty) {
// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// insetPadding: EdgeInsets.only(top: 20),
// backgroundColor: Colors.blue[100],
// title: Text(
// "???????? ???????? ???????????? ",
// textAlign: TextAlign.right,
// ),
// actions: [
// RaisedButton(
// color: Colors.blue,
// child: Row(
// children: [
// GestureDetector(
// onTap: () {
// Navigator.of(context).pop();
// },
// child: Text(
// "??????????",
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold),
// ),
// ),
// ],
// ),
// ),
// ],
// );
// },
// );
// } else if (mobile_user.text == false &&
// password_user.text == true) {
// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// insetPadding: EdgeInsets.only(top: 20),
// backgroundColor: Colors.blue[100],
// title: Text(
// " ???????? ?????? ???????????? ????????",
// textAlign: TextAlign.right,
// ),
// actions: [
// RaisedButton(
// color: Colors.blue,
// child: Row(
// children: [
// GestureDetector(
// onTap: () {
// Navigator.of(context).pop();
// },
// child: Text(
// "??????????",
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold),
// ),
// ),
// ],
// ),
// ),
// ],
// );
// },
// );
// } else if (mobile_user.text == true &&
// password_user.text == false) {
// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// insetPadding: EdgeInsets.only(top: 20),
// backgroundColor: Colors.blue[100],
// title: Text(
// "???????? ???????? ???????????? ??????????",
// textAlign: TextAlign.right,
// ),
// actions: [
// RaisedButton(
// color: Colors.blue,
// child: Row(
// children: [
// GestureDetector(
// onTap: () {
// Navigator.of(context).pop();
// },
// child: Text(
// "??????????",
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold),
// ),
// ),
// ],
// ),
// ),
// ],
// );
// },
// );
// }
