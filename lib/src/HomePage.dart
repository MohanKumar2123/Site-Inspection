import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_coverflow/simple_coverflow.dart';
import 'package:site_inspection/model/ContactModel.dart';
import 'package:site_inspection/model/ProjectModel.dart';
import 'package:site_inspection/model/TaskModel.dart';
import 'package:site_inspection/src/CoummicationPage.dart';
import 'package:site_inspection/src/DocumentPage.dart';
import 'package:site_inspection/src/NoticeLanding.dart';
import 'package:site_inspection/src/NotificationPage.dart';
import 'package:site_inspection/src/ProfilePage.dart';
import 'package:site_inspection/src/ProjectPage.dart';
import 'package:site_inspection/src/ReportPage.dart';
import 'package:site_inspection/src/SitePhotoPage.dart';
import 'package:site_inspection/src/TaskPage.dart';
import 'package:site_inspection/utils/AppColors.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/FadeRoute.dart';
import 'package:site_inspection/utils/ProgressDialogs.dart';
import 'package:site_inspection/utils/circular_profile_avatar.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskModel taskModel;
  ContactModel contactModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String userImage = "",
      userName = "",
      userMobile = "",
      userRole = "",
      orgId = "",
      clientId = "";
  SharedPreferences preferences;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    // TODO: implement initState
    
    getLogoInfo();

    super.initState();
  }

  Future <void >getLogoInfo() async {// return after some time 
    preferences = await SharedPreferences.getInstance();//ascync wiwait for this please
    print(preferences.getString("email"));
    setState(() {
      userImage = preferences.getString("image");
      userName = preferences.getString("name");
      userMobile = preferences.getString("mobile");
      userRole = preferences.getString("role");
      if (userImage == null) {
        userImage =
            "https://www.thealternativeboard.com/hs-fs/hubfs/Dummy%20avatar%20image.jpg?width=240&name=Dummy%20avatar%20image.jpg";
      }
    });
      getAllProjectApi(context);
     getTaskDataApi();
     //getContactAPi(context);
  }

 Future<String> getTaskDataApi() async {
    preferences = await SharedPreferences.getInstance();
    final response = await http.get(
      baseURL1 + 'project/getTask',
      headers: {
        "Accept": "application/json",
        "Authorization": preferences.getString("token")
      },
    );
    print("project data" + response.body);
    var responseData = json.decode(response.body);
    if (responseData['status'] == 200) {
      //data=List<Data>();

      taskModel = TaskModel.fromJson(json.decode(response.body));
  
    }

    return "Success";
  }

  // getContactAPi(BuildContext context) async {
  //   preferences = await SharedPreferences.getInstance();

  //   Map<String, dynamic> sendData = {
  //     "org_id": preferences.getString("orgId"),
  //   };

  //   final response = await http.post(
  //     baseURL1 + 'project/employee',
  //     body: sendData,
  //     headers: {
  //       "Accept": "application/json",
  //       "Authorization": preferences.getString("token")
  //     },
  //   );
  //   print(response.body);

  //   var responseData = json.decode(response.body);

  //   if (responseData['status'] == 200) {
  //     contactModel = ContactModel.fromJson(json.decode(response.body));
  //   }
  // }

  Future<void> getAllProjectApi(BuildContext context) async {
    preferences = await SharedPreferences.getInstance();
    orgId = preferences.getString("orgId");
    clientId = preferences.getString("id");

    Map<String, dynamic> getContactData = {
      "org_id": orgId,
      "client_id": clientId
    };
    ProgressDialogs.showLoadingDialog(context, _keyLoader); //invoking login

    final response = await http.post(
      baseURL1 + 'project/projectListByEmpID',
      body: getContactData,
      headers: {
        "Accept": "application/json",
        "Authorization": preferences.getString("token")
      },
    );

    print(response.body);
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
    var responseData = json.decode(response.body);
    if (responseData['status'] == 200) {
      ProjectModel projectModel =
          ProjectModel.fromJson(json.decode(response.body));
      if (projectModel.data.length > 0) {
        for (var i = 0; i < projectModel.data.length; i++) {
          preferences.setString("pro_id", projectModel.data[0].projId);
          setState(() {
            data.add(Container(
              margin: EdgeInsets.all(10),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            projectModel.data[i].projName,
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
                                    projectModel.data[i].taskcomplete,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Completed",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10),
                                  )
                                ],
                              ),
                              Container(
                                width: 1,
                                height: 30,
                                margin: EdgeInsets.all(10),
                                color: Color(0XFF18CEBB),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    projectModel.data[i].taskpending,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Pending",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            projectModel.data[i].remarks,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Text(
                            "Address:  " + projectModel.data[i].location,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
          });
        }
      }

      return projectModel;
    } else {
      // showMeg(context, responseData['msg']);
    }
    if (responseData['status'] == 400) {
      setState(() {
        data.add(Container(child: Text(responseData['msg'])));
      });
    }
  }

  List<Container> data = new List<Container>();

  Widget widgetBuilder(BuildContext context, int index) {
    if (data.length == 0) {
      return new Container();
    } else {
      return data[index % data.length];
    }
  }

  callNextPage(String label) {
    _scaffoldKey.currentState.openEndDrawer();
    switch (label) {
      case "Tasks":
        Navigator.push(context, FadeRoute(page: TaskPage(taskModel.data)));
        break;
      case "Reports":
        Navigator.push(context, FadeRoute(page: ReportPage()));
        break;
      case "Notices":
        Navigator.push(context, FadeRoute(page: NoticeLandingPage()));
        break;
      case "Documents":
        Navigator.push(context, FadeRoute(page: DocumentPage()));
        break;
      case "Communication":
        Navigator.push(context,
            FadeRoute(page: CommunicationPage()));//contactModel.contactdata
        break;
      case "Project":
        Navigator.push(context, FadeRoute(page: ProjectPage()));
        break;
      case "Site Photos":
        Navigator.push(context, FadeRoute(page: SitePhotoPage()));
        break;
      case "Logout":
        logoutDialog(context, preferences);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
            icon: Image.asset(
              "assets/images/menu.png",
              width: 20,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              "assets/images/alarm.png",
              width: 20,
            ),
            onPressed: () {
              Navigator.push(context, FadeRoute(page: NotificationPage()));
            },
          ),
          IconButton(
            icon: Image.asset(
              "assets/images/settings.png",
              width: 20,
            ),
            onPressed: () {
              Navigator.push(context, FadeRoute(page: ProfilePage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              color: AppColors.primaryColor,
              child: CoverFlow(itemBuilder: widgetBuilder),
            ),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) - 250,
                color: AppColors.bgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                            child: Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Site Visit",
                                        style: TextStyle(
                                            fontFamily: fontName,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "06 Jan, 2020",
                                        style: TextStyle(
                                            fontSize: 10, fontFamily: fontName),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "CHECK IN",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                    fontFamily: fontName),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                height: 25,
                                                child: OutlineButton(
                                                  child: new Text(
                                                    "05:23:21",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                  onPressed: () {},
                                                  borderSide: BorderSide(
                                                      color: Colors.black,
                                                      style: BorderStyle.solid,
                                                      width: 1),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "CHECK OUT",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                    fontFamily: fontName),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                height: 25,
                                                child: OutlineButton(
                                                  child: new Text(
                                                    "05:23:21",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                  onPressed: () {},
                                                  borderSide: BorderSide(
                                                      color: Colors.black,
                                                      style: BorderStyle.solid,
                                                      width: 1),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Stack(
                                      children: <Widget>[
                                        Image.asset(
                                            "assets/images/timweimg.png"),
                                        Center(
                                            child: Text(
                                          "00:00",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ))
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this produces 2 rows.
                        crossAxisCount: 3,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(homeImage.length, (index) {
                          return Center(
                              child: InkWell(
                            onTap: () {
                              callNextPage(homeLabel[index]);
                            },
                            child: Container(
                                width: 120,
                                height: 120,
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        homeImage[index],
                                        width: 40,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        homeLabel[index],
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                )),
                          ));
                        }),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.

          child: Container(
        color: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 180,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 40),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        border: Border.all(
                            width: 3,
                            color: Colors.grey[100],
                            style: BorderStyle.solid)),
                    padding: new EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: fontName,
                                  decoration: TextDecoration.none),
                            ),
                            Text(
                              userMobile,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontFamily: fontName,
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              userRole,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColors.primaryColor,
                                  fontFamily: fontName,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                        CircularProfileAvatar(
                          userImage,
                          errorWidget: (context, url, error) => Container(
                            child: Icon(Icons.error),
                          ),
                          placeHolder: (context, url) => Container(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                          radius: 35,
                          backgroundColor: Colors.transparent,
                          borderWidth: 1,
                          borderColor: Colors.white,
                          elevation: 2.0,
                          cacheImage: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/home.png",
                width: 22,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 14, fontFamily: fontName),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                callNextPage("");
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/project.png",
                width: 22,
              ),
              title: Text(
                'Projects',
                style: TextStyle(fontSize: 14, fontFamily: fontName),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                callNextPage("Project");
              },
            ),
            Container(
                height: 1,
                margin: EdgeInsets.only(left: 70),
                color: Colors.grey[400]),
            ListTile(
              leading: Image.asset(
                "assets/images/task.png",
                width: 22,
              ),
              title: Text(
                'Tasks',
                style: TextStyle(fontSize: 14, fontFamily: fontName),
              ),
              onTap: () {
                callNextPage("Tasks");
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/photo.png",
                width: 22,
              ),
              title: Text(
                'Site Photos',
                style: TextStyle(fontSize: 14, fontFamily: fontName),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                callNextPage("Site Photos");
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/com.png",
                width: 22,
              ),
              title: Text(
                'Communication',
                style: TextStyle(fontSize: 14, fontFamily: fontName),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                callNextPage("Communication");
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/notic.png",
                width: 22,
              ),
              title: Text(
                'Notices',
                style: TextStyle(fontSize: 14, fontFamily: fontName),
              ),
              onTap: () {
                callNextPage("Notices");
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/doc.png",
                width: 22,
              ),
              title: Text(
                'Documents',
                style: TextStyle(fontSize: 14, fontFamily: fontName),
              ),
              onTap: () {
                callNextPage("Documents");
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/report.png",
                width: 22,
              ),
              title: Text(
                'Reports',
                style: TextStyle(fontSize: 14, fontFamily: fontName),
              ),
              onTap: () {
                callNextPage("Reports");
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/logout.png",
                width: 22,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                    color: Color(0XFFFF0000),
                    fontWeight: FontWeight.bold,
                    fontFamily: fontName),
              ),
              onTap: () {
                callNextPage("Logout");
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      )),
    );
  }
}
