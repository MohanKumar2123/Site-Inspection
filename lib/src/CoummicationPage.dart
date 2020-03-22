import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/model/ContactModel.dart';
import 'package:site_inspection/src/ContactPage.dart';
import 'package:site_inspection/utils/AppColors.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/FadeRoute.dart';
import 'package:http/http.dart' as http;
import 'package:site_inspection/utils/ProgressDialogs.dart';

class CommunicationPage extends StatefulWidget {
  //List<ContactData> contactdata;
 // CommunicationPage(this.contactdata);

  @override
  _CommunicationPageState createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {

  List<ContactData> contactdata;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  SharedPreferences preferences;

  bool isLoading=false;
  @override
  void initState() {
    super.initState();
    
    this.getContactInfo();
   //getContactInfo(context);
  }

    Future<String>getContactInfo() async {

    preferences = await SharedPreferences.getInstance();


    Map<String, dynamic> sendData = {
      "org_id": preferences.getString("orgId"),
    };

 //ProgressDialogs.showLoadingDialog(context, _keyLoader);
    final response = await http.post(
      baseURL1 + "project/employee",
      body: sendData,
      headers: {
        "Accept": "application/json",
        "Authorization": preferences.getString("token")
      },
    );
    print(response.body);

    var responseData = json.decode(response.body);

    if (responseData['status'] == 200) {
    
    setState(() {
       ContactModel contactModel =ContactModel.fromJson(json.decode(response.body));
     contactdata=contactModel.contactdata;
    });
    


       
    
    }
    return "Success";
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
            "Communication",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.white,
                fontFamily: fontName,
                decoration: TextDecoration.none),
          ),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Site - 023",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: fontName,
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,FadeRoute(page: Contactpage( contactdata)));
              },
              child: Container(
                  width: 120,
                  height: 120,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/contact.png",
                          width: 40,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Contacts",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                  width: 120,
                  height: 120,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/chat.png",
                          width: 40,
                          color: Color(0XFF8589EF),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Chat",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
