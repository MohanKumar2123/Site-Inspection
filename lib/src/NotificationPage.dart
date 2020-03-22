import 'package:flutter/material.dart';
import 'package:site_inspection/src/SubNotification.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/FadeRoute.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
            "Nofications",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'OpenSans',
                decoration: TextDecoration.none),
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Task",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: fontName,
                              fontSize: 15),
                        ),
                        Text(
                          "15 Mintues ago",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: fontName,
                              color: Color(0XFF18CEBB),
                              fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You have assigned new Task by UserName.",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontFamily: fontName,
                          fontSize: 13),
                    ),
                  ],
                ),
                onTap: (){
                   Navigator.push(context, FadeRoute(page: SubNotification()));
                },
              )
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
          itemCount: 10),
    );
  }
}
