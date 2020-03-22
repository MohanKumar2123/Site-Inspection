import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/src/LoginPage.dart';

import 'AppColors.dart';


String baseURL = "https://siteinspection.upappfactory.app/api/v1/user/";// login

String baseURL1 = "https://siteinspection.upappfactory.app/api/v1/";// project detail

List<String> homeImage = [
  'assets/images/task.png',
  'assets/images/photo.png',
  'assets/images/com.png',
  'assets/images/notic.png',
  'assets/images/doc.png',
  'assets/images/report.png',
];

List<String> homeLabel = [
  'Tasks',
  'Site Photos',
  'Communication',
  'Notices',
  'Documents',
  'Reports',
];

List<String> reportLabel = [
  'Site Visit Report',
  'Snagging Report',
  'Handover Report',
  'Monthly Report',
];
List<String> doclabels = [
  'Contract',
  'Contract Drawings',
  'Specifications',
  'MAS',
  'MES',
  'IR',
  'AS Built',
  'Minutes Of Meetings',
  'Letters',
  'Modifications'
];

List<String> assignedStatus = [
  'In-Progress',
  'Assigned',
  'Completed',
];
List alphabet = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
String fontName = 'OpenSans';
bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return false;
  else
    return true;
}

Future<void> confirmationDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text.rich(
              TextSpan(
                text: 'Do you want to switch current Project to ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Site - 023 ?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  // can add more TextSpans here...
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 120,
                  child: OutlineButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: 30,
                  width: 120,
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: AppColors.primaryColor,
                      child: Text(
                        "Switch",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}

Future<void> logoutDialog(BuildContext context, SharedPreferences preferences) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text.rich(
              TextSpan(
                text: 'Are you sure, you want to logout from the ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Site Inspection app ?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  // can add more TextSpans here...
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 120,
                  child: OutlineButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: 30,
                  width: 120,
                  child: RaisedButton(
                      onPressed: () {
                        preferences.clear();
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "LoginPage", (Route<dynamic> route) => false);
                      },
                      color: AppColors.primaryColor,
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}

showMeg(BuildContext context, String msg) {
  Flushbar(
    title: "Site Inspection",
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    message: msg,
    boxShadows: [
      BoxShadow(
          color: Colors.blue[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)
    ],
    backgroundColor: Color(0XFF92B32C),
    duration: Duration(seconds: 3),
  )..show(context);
}
