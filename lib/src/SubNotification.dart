import 'package:flutter/material.dart';
import 'package:site_inspection/utils/AppConstant.dart';

class SubNotification extends StatefulWidget {
  @override
  _SubNotificationState createState() => _SubNotificationState();
}

class _SubNotificationState extends State<SubNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            "Task Notifications",
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
      body: ListView.separated(
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "You have assigned new Task by UserName.",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontFamily: fontName,
                          fontSize: 13),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "01 Mar 11:00 AM",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: fontName,
                          color: Color(0XFF18CEBB),
                          fontSize: 12),
                    )
                  ],
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
          itemCount: 10),
    );
  }
}
