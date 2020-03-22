import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/model/NoticeType.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/ProgressDialogs.dart';

import 'CreateNotice.dart';
import 'NoticesPage.dart';
import 'package:http/http.dart' as http;

class NoticeLandingPage extends StatefulWidget {
  @override
  _NoticeLandingPageState createState() => _NoticeLandingPageState();
}

class _NoticeLandingPageState extends State<NoticeLandingPage> {
  NoticeTypeModel noticeType;
    final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  NoticeTypeData currentNoticeDataSelected;
                   
  List<NoticeTypeData> noticeTypeData;


  SharedPreferences pref;

  @override
  void initState() {
   
    super.initState();
       this.getNoticeTypeData(context);
      print("initstate");
  }





  Future<String> getNoticeTypeData(BuildContext context) async {

    pref = await SharedPreferences.getInstance();
        
   
    final noticeResponse = await http.get(
      baseURL1 + 'project/getnotic_type',
      headers: {
        "Accept": "application/json",
        "Authorization": pref.getString("token")
      },
    );
    print("getnotic_type" + noticeResponse.body);
    var noticeResponseData = json.decode(noticeResponse.body);
    if (noticeResponseData['status'] == 200) {
     
        setState(() {
          noticeType = NoticeTypeModel.fromJson(json.decode(noticeResponse.body));
          noticeTypeData=noticeType.noticeTypeData;
          print(noticeType.noticeTypeData);
        });
         
     
    
  
    }
      return "Success";
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
            "Notice",
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
        bottom: TabBar(
         
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          tabs: [
            new Tab(text: "Create Notice"),
            new Tab(text: "Notices"),
            
          ],
        ),
      ),
      body: TabBarView(
        children: [
         CreateNotice(noticeTypeData),
          NoticesPage(),
           
        ],
      ),
    ));
  }
}
