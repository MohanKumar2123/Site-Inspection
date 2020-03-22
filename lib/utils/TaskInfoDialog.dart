import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'AppConstant.dart';

class TaskInfoDialog extends StatelessWidget {
  final String title;

  TaskInfoDialog({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: title == "In-Progress"
                        ? Color(0XFF8589EF)
                        : title == "Assigned"
                            ? Color(0XFFFFC611)
                            : Color(0XFF5CBA47),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(3),
                        topLeft: Radius.circular(3))),
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: fontName,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 13),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Title",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              fontFamily: fontName,
                              color: Colors.black),
                        ),
                        Text(
                          "Assigned by",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              fontFamily: fontName,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Event Meeting",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: fontName,
                              color: Colors.black),
                        ),
                        Text(
                          "Muhammed",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: fontName,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Date & Time",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: fontName,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "02 Jan, 2019 | 02:00 PM - 04:00 PM",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: fontName,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Location",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: fontName,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Muscat, Oman",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: fontName,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Task Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: fontName,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: fontName,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
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
                    SizedBox(
                      height: 15,
                    ),
                    Visibility(
                        visible: title != "In-Progress" ? true : false,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: new Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                      style: BorderStyle.solid),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(2.0))),
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
                                      hintText: 'Observation',
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
                                          InkWell(
                                            child: Image.asset(
                                              "assets/images/camera.png",
                                              color: Colors.grey[300],
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
                                        margin: EdgeInsets.only(right: 7),
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
                                      Container(
                                        width: 35,
                                        height: 35,
                                        margin: EdgeInsets.only(right: 7),
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
                                      Container(
                                        width: 35,
                                        height: 35,
                                        margin: EdgeInsets.only(right: 7),
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
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  color: Color(0XFF92B32C),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                )),
                          ],
                        )),
                    Visibility(
                      visible: title == "In-Progress" ? true : false,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: new Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(2.0))),
                            child: TextField(
                              style: TextStyle(
                                  fontFamily: fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.black),
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'Add Comment',
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontFamily: fontName,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey[400]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                  child: SizedBox(
                                height: 35,
                                child: RaisedButton(
                                    color: Color(0XFFFF0000),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel Task",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: SizedBox(
                                height: 35,
                                child: RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    color: Color(0XFF8589EF),
                                    child: Text(
                                      "Add Comments",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
