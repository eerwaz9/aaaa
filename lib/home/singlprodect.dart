import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_appxx/Request/request.dart';

class singalprodct extends StatelessWidget {
  bool isSignupScreen = true;
  int id;
  String name_door;
  String address_door;
  double Meridians_door;
  double latitudes_door;
  String image_door;
  double number_drivery;
  String chiar_number;
  singalprodct({
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => isSignupScreen
                    ? request(
                        name_door: name_door,
                        image_door: image_door,
                        chiar_number: chiar_number,
                      )
                    : request(
                        image_door: " ",
                        name_door: " ",
                      )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(90),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image_door),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Text(
              name_door,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            Text(
              "chiar_number",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class prod {
//   var array_prodect = [
//     {
//       "prodect_id": "1",
//       "name_door": "name_door",
//       "prodect_image": "assent/fo2.jpg",
//     },
//     {
//       "id": "id",
//       "prodect_name": "باب الصديق",
//       "prodect_image": "assent/fo3.jpg",
//     },
//     {
//       "prodect_id": "3",
//       "prodect_name": "باب الرحمه",
//       "prodect_image": "assent/fo4.jpg",
//     },
//     {
//       "prodect_id": "4",
//       "prodect_name": "باب الهجرة",
//       "prodect_image": "assent/fo6.jpg",
//     },
//     {
//       "prodect_id": "5",
//       "prodect_name": "باب الملك سعود",
//       "prodect_image": "assent/fo6.jpg",
//     },
//     {
//       "prodect_id": "6",
//       "prodect_name": "باب الإمام البخاري",
//       "prodect_image": "assent/fo6.jpg",
//     },
//     {
//       "prodect_id": "7",
//       "prodect_name": "باب الهجرة",
//       "prodect_image": "assent/fo6.jpg",
//     },
//     {
//       "prodect_id": "8",
//       "prodect_name": "باب قباء ",
//       "prodect_image": "assent/fo7.jpg",
//     },
//     {
//       "prodect_id": "9",
//       "prodect_name": "باب العقيق",
//       "prodect_image": "assent/fo6.jpg",
//     },
//     {
//       "prodect_id": "10",
//       "prodect_name": "باب السلطان  ",
//       "prodect_image": "assent/fo6.jpg",
//     },
//     {
//       "prodect_id": "11",
//       "prodect_name": "باب الفاروق",
//       "prodect_image": "assent/fo6.jpg",
//     },
//   ];
// }
