import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:http/http.dart' as http;
import 'package:site_inspection/utils/ProgressDialogs.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var usernewPassword = TextEditingController();
  var userPasswordContoral = TextEditingController();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  submitData() {
    if (userPasswordContoral.text.isNotEmpty) {
      if (usernewPassword.text.isNotEmpty) {
        changePasswordAPICall(context);
      } else {
        showMeg(context, "Please enter your new password.");
      }
    } else {
      showMeg(context, "Please enter your Old password.");
    }
  }

  Future<String> changePasswordAPICall(BuildContext context) async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    print(prefe.getString("token"));
    Map<String, dynamic> body = {
      'empid': prefe.getString("id"),
      'password': usernewPassword.text,
    };

    ProgressDialogs.showLoadingDialog(context, _keyLoader); //invoking login
    print("Request Data " + jsonEncode(body));

    final response = await http.put(baseURL + 'empdata',
        //body: body,
        body: jsonEncode(body),
        headers: {
          "Accept": "application/json",
          "Authorization": prefe.getString("token")
        },
        encoding: Encoding.getByName("utf-8"));
    print(response.body);
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
    var responseData = json.decode(response.body);
    showMeg(context, responseData["msg"]);
   if (responseData['status'] == 200) {
      // If the call to the server was successful, parse the JSON

      print(response.body);
      Navigator.of(context).pushNamedAndRemoveUntil(
          "LoginPage", (Route<dynamic> route) => false);
      return "loginModel";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back, color: Colors.white),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0XFF92B32C),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Change Password",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'OpenSans',
                decoration: TextDecoration.none),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(40),
        child: Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/images/logo.png",
            width: 160,
          ),
          Image.asset(
            "assets/images/app_name.png",
            width: 140,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            child: TextField(
              controller: userPasswordContoral,
              obscureText: true,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0XFF18CEBB)),
              decoration: InputDecoration(
                  hintText: 'Old Password',
                  filled: true,
                  fillColor: Color(0XFFF8F8F8),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w300,
                      color: Color(0XFF18CEBB))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 45,
            child: TextField(
              controller: usernewPassword,
              obscureText: true,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0XFF18CEBB)),
              decoration: InputDecoration(
                  hintText: 'New Password',
                  filled: true,
                  fillColor: Color(0XFFF8F8F8),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w300,
                      color: Color(0XFF18CEBB))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              onPressed: () {
                submitData();
              },
              color: Color(0XFF92B32C),
              child: Text(
                "Submit",
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
