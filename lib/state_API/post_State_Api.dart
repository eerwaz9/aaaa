import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class postState with ChangeNotifier {
  Future<bool> Userapi(String first_name, String laste_name, String canter,
      String mobile_user, double number_card, String password_user) async {
    try {
      String url = 'http://10.0.2.2:8000/Userapi/';

      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'first_name': first_name,
          'laste_name': laste_name,
          'canter': canter,
          'mobile_user': mobile_user,
          'number_card': number_card,
          'password_user': password_user,
        }),
      );
      print(response.body);
      Map data;
      if (response.statusCode == 201) {
        data = json.decode(response.body) as Map;
        if (data['error'] = false) {
          return false;
        }
        return data['error'];
      }
    } catch (e) {
      print("error register now");
      print(e);
      return true;
    }
  }
}
