import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences prefe;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // time out for splash screen
     startTimeout(3000);
  }

  var timeout = const Duration(seconds: 3);
  var ms = const Duration(milliseconds: 1);

  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }
 // way to divert the screen for opening between home screen or login page 
  void handleTimeout() async {
    // wait for getting instance  of  sared prefernce 
    prefe = await SharedPreferences.getInstance();
    // callback function
    if (prefe.getString("token") != null) {
      if (prefe.getString("token").isNotEmpty) {
        Navigator.of(context).pushNamedAndRemoveUntil(
                            "HomePage", (Route<dynamic> route) => false);
      } else {
        // when not login ie token empty 
        Navigator.of(context).pushNamedAndRemoveUntil(
                            "LoginPage", (Route<dynamic> route) => false);
      }
    } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
                            "LoginPage", (Route<dynamic> route) => false);
    }
    print("Handler");
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: Container(
              color: Color(0XFF92B32C),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/white_icon.png",
                      width: 160,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      "assets/images/app_name.png",
                      width: 140,
                      color: Colors.white,
                    ),
                  ],
                ),
              )),
        ));
  }
}
