import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/model/LoginModel.dart';
import 'package:site_inspection/src/ForgotPassword.dart';

import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/FadeRoute.dart';
import 'package:http/http.dart' as http;
import 'package:site_inspection/utils/ProgressDialogs.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  var userNameContoral = TextEditingController();
  var userPasswordContoral = TextEditingController();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  submitData() {
    if (userNameContoral.text.isNotEmpty) {
      if (userPasswordContoral.text.isNotEmpty) {
        // Navigator.push(context, FadeRoute(page: HomePage()));
        // call only when both are not empty
        doLoginApi(context);
      } else {
        Flushbar(
          title: "Site Inspection",
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          message: "Please enter your password.",
          boxShadows: [
            BoxShadow(
                color: Colors.blue[800],
                offset: Offset(0.0, 2.0),
                blurRadius: 3.0)
          ],
          backgroundColor: Color(0XFF92B32C),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    } else {
      Flushbar(
        title: "Site Inspection",
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        message: "Please enter your username.",
        boxShadows: [
          BoxShadow(
              color: Colors.blue[800],
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0)
        ],
        backgroundColor: Color(0XFF92B32C),
        duration: Duration(seconds: 3),
      )..show(context);
    }
  }

  Future<String> doLoginApi(BuildContext context) async {
    Map<String, dynamic> body = {
      'username': userNameContoral.text,
      'password': userPasswordContoral.text,
      'mode': ""
    };
    ProgressDialogs.showLoadingDialog(context, _keyLoader); //invoking login
    print("Request Data " + jsonEncode(body));

    final response = await http.post(baseURL + 'login',
        //body: body,
        body: jsonEncode(body),
        headers: {
          "Accept": "application/json",
         // "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"));
    print(response.body);
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();// home page 
    var responseData = json.decode(response.body);
  
   if (responseData['status'] == 200) {
      // If the call to the server was successful, parse the JSON

      print(response.body);
      LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
      saveData(loginModel);
      return "loginModel";
    } else {
      showMeg(context,responseData["msg"]);
    }
  }

  saveData(LoginModel loginModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", loginModel.token);
     await prefs.setString("orgId", loginModel.data.orgId);
    await prefs.setString("image", loginModel.data.photo);
    await prefs.setString("name", loginModel.data.fullname);
    await prefs.setString("id", loginModel.data.empId);
    await prefs.setString("email", loginModel.data.email);
    await prefs.setString("role", loginModel.data.rolename);
    await prefs.setString("mobile", loginModel.data.phone);
     Navigator.of(context).pushNamedAndRemoveUntil(
                            "HomePage", (Route<dynamic> route) => false);
    //  prefs.commit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
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
            height: 50,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Sign In",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            child: TextField(
              controller: userNameContoral,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0XFF18CEBB)),
              decoration: InputDecoration(
                  hintText: 'Username',
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
              controller: userPasswordContoral,
              obscureText: true,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0XFF18CEBB)),
              decoration: InputDecoration(
                  hintText: 'Password',
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
            height: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, FadeRoute(page: ForgotPassword()));
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0XFF18CEBB)),
                ),
              )),
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
                "Login",
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
