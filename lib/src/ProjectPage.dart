import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/model/ProjectModel.dart';
import 'package:site_inspection/utils/AppColors.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/ProgressDialogs.dart';
import 'package:http/http.dart' as http;

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  SharedPreferences preferences;
  ProjectModel projectModel;
  List<Data> data = new List<Data>();

  @override
  void initState() {
    // TODO: implement initState
    getAllProjectData(context);
    super.initState();
  }

  Future<ProjectModel> getAllProjectData(BuildContext context) async {
    preferences = await SharedPreferences.getInstance();
    ProgressDialogs.showLoadingDialog(context, _keyLoader); //invoking login

    final response = await http.get(
      baseURL1 + 'project/allproject',
      //body: body,

      headers: {
        "Accept": "application/json",
        "Authorization": preferences.getString("token")
      },
    );

    print("project data"+response.body);
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
    var responseData = json.decode(response.body);
    if (responseData['status'] == 200) {
      projectModel = ProjectModel.fromJson(json.decode(response.body));
      data = new List<Data>();
      if (projectModel.data.length > 0) {
        setState(() {
          data = projectModel.data;
        });
        return projectModel;
      } else {
        showMeg(context, responseData["msg"]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          child: Icon(Icons.arrow_back, color: Colors.transparent),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0XFF92B32C),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Projects",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.white,
                fontFamily: fontName,
                decoration: TextDecoration.none),
          ),
        ),
        actions: <Widget>[
          InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.clear,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            margin: EdgeInsets.all(10),
            //decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey[500],
                  size: 20,
                )
              ],
            ),
          ),
          Expanded(
              child: data.length > 0
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: InkWell(
                            child: Card(
                              color: Colors.white,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                            child: Text(
                                          data[index].projName,//modify
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                              color: AppColors.primaryColor),
                                        )),
                                        Row(
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  data[index].taskcomplete,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                  "Completed",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 10),
                                                )
                                              ],
                                            ),
                                            Container(
                                              width: 1,
                                              height: 25,
                                              margin: EdgeInsets.all(10),
                                              color: Color(0XFF18CEBB),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  data[index].taskpending,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                  "Pending",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 10),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          data[index].remarks,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "Address: " + data[index].location,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              confirmationDialog(context);
                            },
                          ),
                        );
                      },
                      itemCount: data.length,
                    )
                  : Center(child: Text("No record found.",style: TextStyle(color: Colors.white),)))
        ],
      ),
    );
  }
}
