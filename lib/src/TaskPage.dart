import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/model/TaskModel.dart';
import 'package:site_inspection/src/TaskDetailsLanding.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/FadeRoute.dart';

class TaskPage extends StatefulWidget {
  List<Data> taskData;

  TaskPage(List<Data> data) {
    this.taskData = data;
  }

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
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
              "Tasks",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'OpenSans',
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
                    fontFamily: 'OpenSans',
                    decoration: TextDecoration.none),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.taskData[index].taskName.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      widget.taskData[index].complete
                                          .toString(),
                                      style: TextStyle(
                                          color: Color(0XFF92B32C),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      "Completed",
                                      style: TextStyle(
                                          color: Color(0XFF92B32C),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 1,
                                  height: 20,
                                  margin: EdgeInsets.all(10),
                                  color: Color(0XFF18CEBB),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      widget.taskData[index].progress
                                          .toString(),
                                      style: TextStyle(
                                          color: Color(0XFF8589EF),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      "Pending",
                                      style: TextStyle(
                                          color: Color(0XFF8589EF),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    FadeRoute(
                        page: TaskDetailsLanding(
                      title: widget.taskData[index].taskName,
                    )));
              },
            );
          },
          itemCount: widget.taskData.length,
        ));
  }
}
