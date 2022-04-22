import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

////////////////////////////////////////////////////////////////////
Widget buildregester(
  IconData icon,
  String labelText,
  bool isPassword,
  bool isEmail,
  TextEditingController controller,
  String text,
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
              child: TextFormField(
                controller: controller,
                obscureText: isPassword,
                validator: (v) {
                  if (v.isEmpty) {
                    return text;
                  }
                  return null;
                },
                onSaved: (v) {
                  // input = v;
                },
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
///////////////////////////////////////////////////////////////////

Widget buildlogin(IconData icon, String labelText, bool isPassword,
    bool isEmail, TextEditingController controller, String text) {
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
              child: TextFormField(
                controller: controller,
                obscureText: isPassword,
                validator: (v) {
                  if (v.isEmpty) {
                    return text;
                  }
                  return null;
                },
                onSaved: (v) {
                  // input = v;
                },
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

////////////////////////////////////////////////////////////////////
Widget showDilaog(
  String text,
  BuildContext context,
) {
  return AlertDialog(
    insetPadding: EdgeInsets.only(top: 20),
    backgroundColor: Colors.blue[100],
    title: Text(
      "رقم الهاتف او كلمة المرور غير صحيحة !",
      textAlign: TextAlign.right,
    ),
    actions: [
      RaisedButton(
        color: Colors.blue,
        child: Row(
          children: [
            GestureDetector(
              onTap: (() {
                Navigator.of(context).pop();
              }),
              child: Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
}

//////////////////////////////////////////////////////////////////////////////////////////////////
Widget buildPhone(TextEditingController input) {
  return Column(
    children: [
      Padding(padding: EdgeInsets.only(bottom: 8)),
      Column(
        children: [
          Container(
            height: 70,
            width: 450,
            padding: EdgeInsets.only(bottom: 8, left: 25, top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white24,
              ),
              child: Stack(
                children: [
                  InternationalPhoneNumberInput(
                    validator: (v) {
                      if (v.isEmpty) {
                        return 'Enter a Username';
                      }
                      return null;
                    },
                    onSaved: (v) {
                      // input = v;
                    },
                    textStyle: TextStyle(fontSize: 20),
                    onInputChanged: (value) {
                      input.text = value.phoneNumber;
                    },
                    formatInput: false,
                    selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
                    inputDecoration: InputDecoration(
                      icon: Icon(
                        Icons.phone_android,
                        color: Colors.blueAccent,
                      ),
                      labelText: "رقم الهاتف",
                    ),
                  )
                ],
              ),
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

//////////////////////////////////////////////////////////////////////////////////////////////////
iconHeader_shoping(Color cl, ic, add) {
  return GestureDetector(
    onTap: (add),
    child: Container(
      decoration: BoxDecoration(
        //  color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: cl,
            blurRadius: 1,
            spreadRadius: 3,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: null,
        icon: FaIcon(
          ic,
          color: Colors.white,
        ),
      ),
    ),
  );
}
