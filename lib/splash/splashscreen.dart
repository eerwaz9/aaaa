import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../screen/login_signup.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  Timer animTimer;
  double _width = 0;
  double _height = 0;
  @override
  void initState() {
    _width = 0;
    _height = 0;
    Future.delayed(Duration(microseconds: 0), () {
      setState(() {
        _width = 300;
        _height = 300;
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _width = 0;
        _height = 0;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => LoginSignupScreen()));
    });
    super.initState;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInSine,
          width: _width,
          height: _height,
          child: Container(
            width: _width,
            height: _height,
            alignment: Alignment.center,
            child: Container(
                decoration: BoxDecoration(),
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      image:
                          DecorationImage(image: AssetImage("assent/fo5.png"))),
                )),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    //  theem.PrimaryColor,
                    theem.foure,
                    theem.scuondColor,
                  ]),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
            //  theem.PrimaryColor,
            theem.scuondColor,
            theem.foure,
          ])),
    );
  }
}
// SimpleShadow(
// opacity: 0.7,
// color: Colors.black26,
// offset: Offset(2, 2),
// sigma: 8,
// child: Image(
//
//
// image: AssetImage(
// "assent/fo5.png",
// ),
// width: 300,
// height: 300,
// ),
// ),
