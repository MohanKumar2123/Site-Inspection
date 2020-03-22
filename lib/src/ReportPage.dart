import 'package:flutter/material.dart';
import 'package:site_inspection/src/ReportLanding.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/FadeRoute.dart';

import 'AllReportsPage.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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
              "Reports",
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
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child:Container(
              margin: EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Card(
                elevation: .5,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                            child: Align(
                              child: Text(
                                reportLabel[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    fontFamily: fontName,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: (){
               Navigator.push(context, FadeRoute(page: ReportLanding(title: reportLabel[index],)));
            },
            );
          },
          itemCount: reportLabel.length,
        ));
  }
}
