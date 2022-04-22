import 'package:flutter/material.dart';

import 'home/Home.dart';

void main() {
  runApp(LoginSignupUI());
}

class LoginSignupUI extends StatelessWidget {
  const LoginSignupUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Signup UI",
      home: Home(),
    );
  }
}
// ‏أفضل النساء هي التي تغار على نفسها من عيون الرجال ، يدفعها إلى ذلك قوة الإيمان، كغيرة الرجل الشّريف على نساءه، وتخشى على نفسها من سِهام نظرة غادرة
