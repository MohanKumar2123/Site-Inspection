import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/src/ChangePassword.dart';
import 'package:site_inspection/src/NotificationSetting.dart';
import 'package:site_inspection/utils/AppColors.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/FadeRoute.dart';
import 'package:site_inspection/utils/circular_profile_avatar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userImage = "",
      userName = "",
      userMobile = "",
      userRole = "",
      userEmail = "";
  SharedPreferences preferences;
  @override
  void initState() {
  
    getLogoInfo();
    super.initState();
  }

  getLogoInfo() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      userImage = preferences.getString("image");
      userName = preferences.getString("name");
      userMobile = preferences.getString("mobile");
      userRole = preferences.getString("role");
      userEmail = preferences.getString("email");
      if (userImage == null) {
        userImage =
            "https://www.thealternativeboard.com/hs-fs/hubfs/Dummy%20avatar%20image.jpg?width=240&name=Dummy%20avatar%20image.jpg";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
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
            "My Profile",
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
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(50.0)),
                padding: new EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
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
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userName,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          userRole,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              decoration: TextDecoration.none),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Account Info",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.grey,
                    fontFamily: 'OpenSans',
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(5.0)),
                padding: new EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Username',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      userName,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[300],
                      margin: EdgeInsets.only(top: 5, bottom: 20),
                    ),
                    Text(
                      'Email',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      userEmail,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[300],
                      margin: EdgeInsets.only(top: 5, bottom: 20),
                    ),
                    Text(
                      'Phone',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      userMobile,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[300],
                      margin: EdgeInsets.only(top: 5, bottom: 10),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Settings",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.grey,
                    fontFamily: 'OpenSans',
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(5.0)),
                padding: new EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Title',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      userRole,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[300],
                      margin: EdgeInsets.only(top: 5, bottom: 20),
                    ),
                    Text(
                      'Location',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Muscut, Oman',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[300],
                      margin: EdgeInsets.only(top: 5, bottom: 20),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context, FadeRoute(page: NotificationSetting()));
                        },
                        child: SizedBox(
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Notifications',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[300],
                      margin: EdgeInsets.only(top: 5, bottom: 10),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context, FadeRoute(page: ChangePassword()));
                        },
                        child: SizedBox(
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Change Password',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: InkWell(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/logout.png",
                        width: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            color: Color(0XFFFF0000),
                            fontWeight: FontWeight.bold,
                            fontFamily: fontName),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  logoutDialog(context,preferences);
                },
              )),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
