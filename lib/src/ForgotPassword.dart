import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/ProgressDialogs.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Color validPhone = Colors.transparent;
  var phoneContor = TextEditingController();
final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  submitData() {
    if (phoneContor.text.isNotEmpty) {
      if (validateEmail(phoneContor.text)) {
        userCallForgotAPI(context);
      } else {
        showMeg(context, "Please enter your valid email address");
      }
    } else {
      showMeg(context, "Please enter your email address");
    }
  }
Future<String> userCallForgotAPI(BuildContext context) async {
    Map<String, dynamic> body = {
      'email': phoneContor.text,
    };
    ProgressDialogs.showLoadingDialog(context, _keyLoader); //invoking login
    print("Request " +
         
        body.toString());

    final response = await http.post(baseURL + 'empdataforget',
        //body: body,
        body: body,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"));
    print(response.body);
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
    var responseData = json.decode(response.body);
    showMeg(context, responseData["msg"]);
    if (responseData['status'] == 200) {
      // If the call to the server was successful, parse the JSON
      Navigator.of(context).pushNamedAndRemoveUntil(

          "LoginPage", (Route<dynamic> route) => false);// dont go to login page 
      print(response.body);

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
            "Forgot Password",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'OpenSans',
                decoration: TextDecoration.none),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter your Email to Recevie a Verification Code.",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    decoration: TextDecoration.none),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                controller: phoneContor,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                // inputFormatters: [
                //   LengthLimitingTextInputFormatter(10),
                // ],
                onChanged: (text) {
                  if (validateEmail(text)) {
                    setState(() {
                      validPhone = Color(0XFF92B32C);
                    });
                  } else {
                    setState(() {
                      validPhone = Colors.transparent;
                    });
                  }
                  print("First text field: $text");
                },
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'Email Address',
                    filled: true,
                    // prefix: Text("+968 "),
                    prefixStyle: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    fillColor: Color(0XFFF8F8F8),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.check_circle, color: validPhone),
                    hintStyle: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey)),
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
                  "Get Link",
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
      ),
    );
  }
}
