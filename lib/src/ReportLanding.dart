import 'package:flutter/material.dart';
import 'package:site_inspection/src/AllReportsPage.dart';
import 'package:site_inspection/src/NewReports.dart';
import 'package:site_inspection/src/SubmittedReport.dart';
import 'package:site_inspection/utils/AppConstant.dart';

class ReportLanding extends StatefulWidget {
  String title;
  ReportLanding({Key key, @required this.title}) : super(key: key);
  @override
  _ReportLandingState createState() => _ReportLandingState();
}

class _ReportLandingState extends State<ReportLanding> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
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
        bottom: TabBar(
         
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          tabs: [
            new Tab(text: "New Report"),
            new Tab(text: "Submitted"),
            new Tab(text: "All Reports")
          ],
        ),
      ),
      body: TabBarView(
        children: [
          NewReports(),
          SubmittedReport(),
          AllReportsPage()
        ],
      ),
    ));
  }
}
