import 'package:flutter/material.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/TaskInfoDialog.dart';

class AssignedTaskInfoPage extends StatefulWidget {
  String title;
  AssignedTaskInfoPage({Key key, @required this.title}) : super(key: key);
  @override
  _AssignedTaskInfoPageState createState() => _AssignedTaskInfoPageState();
}

class _AssignedTaskInfoPageState extends State<AssignedTaskInfoPage> {
  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              color: Colors.amber,
              width: MediaQuery.of(context).size.width,
              child: Text("data"),
            ),
            content: TextField(
              decoration: InputDecoration(hintText: "TextField in Dialog"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Assigned Task",
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
                widget.title,
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
          ]),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                elevation: 4,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MergeSemantics(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      "Event Meeting",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          fontFamily: fontName,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    "2 Photos",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        fontFamily: fontName,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Assigned to Salman",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: fontName,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      )),
                      Container(
                        height: 90,
                        decoration: BoxDecoration(
                            color: assignedStatus[index] == "In-Progress"
                                ? Color(0XFF8589EF)
                                : assignedStatus[index] == "Assigned"
                                    ? Color(0XFFFFC611)
                                    : Color(0XFF5CBA47),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(2),
                                bottomRight: Radius.circular(2))),
                        padding: EdgeInsets.only(left: 7, right: 7),
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                              child: Text(
                            assignedStatus[index],
                            style: TextStyle(
                                fontFamily: fontName,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 13),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => TaskInfoDialog(
                    title: assignedStatus[index],
                  ),
                );
              },
            );
          },
          itemCount: assignedStatus.length,
        ),
      ),
    );
  }
}
