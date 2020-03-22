import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:site_inspection/utils/AppConstant.dart';

class NoticesPage extends StatefulWidget {
  @override
  _NoticesPageState createState() => _NoticesPageState();
}

class _NoticesPageState extends State<NoticesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Card(
                  elevation: .5,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Notice Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    fontFamily: fontName,
                                    color: Colors.black),
                              ),
                              Text(
                                "Dec 27, 2019",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                    fontFamily: fontName,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Sent To: ContactName1, ContactName2, ContactName3, ContactName4",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                fontFamily: fontName,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Date to be Corrected",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                fontFamily: fontName,
                                color: Colors.black54),
                          ),
                          ExpandableNotifier(
                              child: Container(
                                  child: ScrollOnExpand(
                                      child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Builder(builder: (context) {
                                    var controller =
                                        ExpandableController.of(context);
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                50,
                                        child: InkWell(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Jan 03, 2020",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    fontFamily: fontName,
                                                    color: Colors.black54),
                                              ),
                                              Icon(
                                                controller.expanded
                                                    ? Icons.keyboard_arrow_up
                                                    : Icons.keyboard_arrow_down,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Location of Defect",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              fontFamily: fontName,
                                              color: Colors.black),
                                        )),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Door closer in the Main building tend to dislocate the main arm from the Mechanism",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              fontFamily: fontName,
                                              color: Colors.black54),
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Description",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              fontFamily: fontName,
                                              color: Colors.black),
                                        )),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "ExpandablePanel has a number of properties to customize its behavior, but it's restricted by having a title at the top and an expand icon shown as a down arrow (on the right or on the left).",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              fontFamily: fontName,
                                              color: Colors.black54),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 5,
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
                                  ],
                                ),
                              ),
                            ],
                          )))),
                        ],
                      ))));
        },
        itemCount: 3,
      ),
    );
  }
}
