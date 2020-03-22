import 'package:flutter/material.dart';
import 'package:site_inspection/utils/AppColors.dart';
import 'package:site_inspection/utils/AppConstant.dart';

class AllReportsPage extends StatefulWidget {
   
  @override
  _AllReportsPageState createState() => _AllReportsPageState();
}

class _AllReportsPageState extends State<AllReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          
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
                  child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Card(
                        elevation: .5,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Report No.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10,
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
                              Text(
                                "HPMU-PMF 21",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                    fontFamily: fontName,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Rev No.",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10,
                                              fontFamily: fontName,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "12345",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 13,
                                              fontFamily: fontName,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      InkWell(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/images/export.png",
                                              width: 25,
                                            ),
                                            Text(
                                              "Export",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 10,
                                                  fontFamily: fontName,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        onTap: () {},
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/images/send.png",
                                              width: 25,
                                              color: AppColors.primaryColor,
                                            ),
                                            Text(
                                              "Send",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10,
                                                fontFamily: fontName,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      //   Navigator.push(context, FadeRoute(page: SubReportPage(title: reportLabel[index],)));
                    },
                  );
                },
                itemCount: 5,
              ))
            ],
          ),
        );
  }
}
