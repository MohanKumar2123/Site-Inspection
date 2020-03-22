import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:site_inspection/utils/AppConstant.dart';

class SubDocumentPage extends StatefulWidget {
  String title;
  SubDocumentPage({Key key, @required this.title}) : super(key: key);
  @override
  _SubDocumentPageState createState() => _SubDocumentPageState();
}

class _SubDocumentPageState extends State<SubDocumentPage> {
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
            widget.title,
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
              "Site - 023",
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
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
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
              child: Container(
                  margin: EdgeInsets.all(15),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 30, bottom: 10),
                              padding: EdgeInsets.all(15),
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width-10,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Document Name",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                                fontFamily: fontName,
                                                color: Colors.black54),
                                          ),
                                          SizedBox(
                                            width: 140,
                                          ),
                                          Text(
                                            "23-01-2020",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10,
                                                fontFamily: fontName,
                                                color: Color(0XFF18CEBB)),
                                          ),
                                        ],
                                      ),
                                      ExpandableNotifier(
                                          child: Container(
                                              child: ScrollOnExpand(
                                                  child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Builder(builder: (context) {
                                                var controller =
                                                    ExpandableController.of(
                                                        context);
                                                return Container(
                                                    child: InkWell(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        "Description about the Document",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                fontName,
                                                            color: Colors.grey),
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                      ),
                                                      Icon(
                                                        controller.expanded
                                                            ? Icons
                                                                .keyboard_arrow_up
                                                            : Icons
                                                                .keyboard_arrow_down,
                                                        color: Colors.grey[400],
                                                      )
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    controller.toggle();
                                                  },
                                                ));
                                              })
                                            ],
                                          ),
                                          Expandable(
                                            collapsed: Container(),
                                            expanded: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Deparment",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 12,
                                                          fontFamily: fontName,
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      width: 158,
                                                    ),
                                                    Text(
                                                      "Transmittal No.",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 12,
                                                          fontFamily: fontName,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Materials",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          fontFamily: fontName,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      width: 190,
                                                    ),
                                                    Text(
                                                      "000000000",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          fontFamily: fontName,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 12,
                                                          fontFamily: fontName,
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      width: 203,
                                                    ),
                                                    Text(
                                                      "Revision No.",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 12,
                                                          fontFamily: fontName,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Approved",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          fontFamily: fontName,
                                                          color: Color(0XFF8589EF)),
                                                    ),
                                                    SizedBox(
                                                      width: 180,
                                                    ),
                                                    Text(
                                                      "000000000",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          fontFamily: fontName,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))))
                                    ],
                                  ),
                                ],
                              )),
                          Positioned(
                            child: Center(
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    "PDF",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                            left: 0,
                            top: 5,
                          )
                        ],
                      );
                    },
                    itemCount: 10,
                  )))
        ],
      ),
    );
  }
}
