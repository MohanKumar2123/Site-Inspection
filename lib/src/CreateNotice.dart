import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/model/NoticeType.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:http/http.dart' as http;

class CreateNotice extends StatefulWidget {
  List<NoticeTypeData> noticeTypeData;
  CreateNotice(this.noticeTypeData);

  @override
  _CreateNoticeState createState() => _CreateNoticeState();
}

class _CreateNoticeState extends State<CreateNotice> {
  var dateControl = TextEditingController();




  var _currentSelectedValue = "Assign Task";

  SharedPreferences pref;

  NoticeTypeData  currentNoticeDataSelected;
  @override
  void initState() {

    super.initState();

    setState(() {
      dateControl.text = "Oct 23, 2019";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text(
                "Notice Type",
                style: TextStyle(fontFamily: fontName),
              ),
              SizedBox(
                height: 10,
              ),
            widget.noticeTypeData.length!=null? DropdownButtonHideUnderline(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton(
                    style: TextStyle(
                        fontFamily: fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey[400]),
                    items:widget.noticeTypeData.map((map) {
                      return DropdownMenuItem<NoticeTypeData>(
                        value: map,
                        child: Text(map.nottypeName,
                            style: TextStyle(fontFamily: fontName)),
                      );
                    }).toList(),
                    onChanged: (NoticeTypeData newValueSelected) {
                      setState(() {
                        this.currentNoticeDataSelected = newValueSelected;
                      });
                    },
                    value: currentNoticeDataSelected,
                  ),
                ),
              ):Container(child: CircularProgressIndicator(),),
              SizedBox(
                height: 15,
              ),
              Text(
                "Notice Title",
                style: TextStyle(fontFamily: fontName),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(
                    fontFamily: fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter Title',
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontFamily: fontName,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Date to be corrected",
                style: TextStyle(fontFamily: fontName),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.date_range),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Oct 23, 2019")
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
              Text(
                "Location",
                style: TextStyle(fontFamily: fontName),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(
                    fontFamily: fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter Defect Location',
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontFamily: fontName,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Sent To",
                style: TextStyle(fontFamily: fontName),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(
                    fontFamily: fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Multiple Contact Select',
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontFamily: fontName,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[400]),
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[400],
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Description",
                style: TextStyle(fontFamily: fontName),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    TextField(
                      style: TextStyle(
                          fontFamily: fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.black),
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Add Note',
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                            fontFamily: fontName,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[400]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: Image.asset(
                                "assets/images/camera.png",
                                color: Colors.grey,
                                width: 25,
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 25,
                              color: Colors.grey,
                              margin: EdgeInsets.all(10),
                            ),
                          ],
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                              border: new Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          child: Image.asset(
                            "assets/images/dummy.png",
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                              border: new Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          child: Image.asset(
                            "assets/images/dummy.png",
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                              border: new Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          child: Image.asset(
                            "assets/images/dummy.png",
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Color(0XFF92B32C),
                    child: Text(
                      "Send ",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
            ])));
  }

  
}
