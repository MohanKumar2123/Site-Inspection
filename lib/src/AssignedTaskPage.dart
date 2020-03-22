import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/model/TaskModel.dart';
import 'package:site_inspection/src/AssignedTaskInfoPage.dart';

import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/FadeRoute.dart';

import 'package:http/http.dart' as http;


class AssignedTaskPage extends StatefulWidget {
  @override
  _AssignedTaskPageState createState() => _AssignedTaskPageState();
}

class _AssignedTaskPageState extends State<AssignedTaskPage> {

  var taskName, taskTitle,taskDesc, status, assignTo;
  var dateNum, date, details;
  
  String assignedTask;
    SharedPreferences preferences;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  SharedPreferences pref;
  
@override
  void initState() {
   
    super.initState();
       this.getassignedTaskApi();
      print("initstate");
  }


 Future<String> getassignedTaskApi() async {
   pref = await SharedPreferences.getInstance();

    preferences = await SharedPreferences.getInstance();
    final response = await http.get(
      baseURL1 + 'project/getassigned_task',
      headers: {
        "Accept": "application/json",
        "Authorization": preferences.getString("token")
      },
    );
    print("project data" + response.body);
    var responseData = json.decode(response.body);
    if (responseData['status'] == 200) {
      print(responseData);
      print("**********************************");
      setState(() {
      var resData = json.decode(response.body);
      // print(resData);
      //  print("**********************************");
      var data = resData['data'];
     
     for(var i=0; data.length;i++){

     }
      dateNum = data['2020-12-31'];
      date = data['date'];
      // print(date);
      // print("*********Date****************");
       details = dateNum['details'];

      for(var i = 0; i<details.length; i++){
      taskName = details[i]['task_name'];      
      taskTitle = details[i]['task_title'];
      taskDesc = details[i]['task_desc'];
      status = details[i]['status'];
      assignTo = details[i]['assign_to'];
      print(taskName);
      print(taskTitle);
      print(taskDesc);
      print(status);
      print(assignTo);      
      print("**********************************");
      }

      });

    }
    return "Success";
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(7),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ExpandableNotifier(
                      child: Container(
                          child: ScrollOnExpand(
                              child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        
                        // builder because  child parent relationship
                        Builder(builder: (context) {
                            var controller = ExpandableController.of(context);
                            return Container(
                              width: MediaQuery.of(context).size.width - 40,
                              child: InkWell(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "January, 2021",// modify 
                                      style: TextStyle(
                                          fontFamily: fontName,
                                          fontSize: 13,
                                          color: Color(0XFF5CBA47),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      controller.expanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: Color(0XFF5CBA47),
                                    )
                                  ],
                                ),
                                onTap: () {
                                  controller.toggle();
                                },
                              ),
                            );
                          })
                        ],
                      ),
                      Expandable(
                          collapsed: Container(),
                          expanded: Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 7),
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "05-Jan",
                                          style: TextStyle(
                                              fontFamily: fontName,
                                              fontSize: 13,
                                              color: Color(0XFF8589EF),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0XFF8589EF),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadeRoute(
                                              page: AssignedTaskInfoPage(
                                            title: "05-Jan",
                                          )));
                                    },
                                  )),
                              Container(
                                  margin: EdgeInsets.only(right: 7),
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "04-Jan",
                                          style: TextStyle(
                                              fontFamily: fontName,
                                              fontSize: 13,
                                              color: Color(0XFF8589EF),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0XFF8589EF),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadeRoute(
                                              page: AssignedTaskInfoPage(
                                            title: "04-Jan",
                                          )));
                                    },
                                  )),
                              Container(
                                  margin: EdgeInsets.only(right: 7),
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "03-Jan",
                                          style: TextStyle(
                                              fontFamily: fontName,
                                              fontSize: 13,
                                              color: Color(0XFF8589EF),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0XFF8589EF),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadeRoute(
                                              page: AssignedTaskInfoPage(
                                            title: "03-Jan",
                                          )));
                                    },
                                  )),
                              Container(
                                  margin: EdgeInsets.only(right: 7),
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "02-Jan",
                                          style: TextStyle(
                                              fontFamily: fontName,
                                              fontSize: 13,
                                              color: Color(0XFF8589EF),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0XFF8589EF),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadeRoute(
                                              page: AssignedTaskInfoPage(
                                            title: "02-Jan",
                                          )));
                                    },
                                  )),
                              Container(
                                  margin: EdgeInsets.only(right: 7),
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "01-Jan",
                                          style: TextStyle(
                                              fontFamily: fontName,
                                              fontSize: 13,
                                              color: Color(0XFF8589EF),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0XFF8589EF),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadeRoute(
                                              page: AssignedTaskInfoPage(
                                            title: "01-Jan",
                                          )));
                                    },
                                  ))
                            ],
                          )),
                    ],
                  ))))
                ],
              ),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
