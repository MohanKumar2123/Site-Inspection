import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:site_inspection/service/service_locator.dart';
import 'package:site_inspection/src/HomePage.dart';
import 'package:site_inspection/src/LoginPage.dart';

import 'package:site_inspection/src/SplashScreen.dart';

void main(){
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color(0XFF92B32C)));
    return MaterialApp(
      title: 'Site Inspection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        accentColor: Color(0XFF92B32C)
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "LoginPage": (BuildContext context) => new LoginPage(),
         "HomePage": (BuildContext context) => new HomePage(),
      },
    );
  }
}
