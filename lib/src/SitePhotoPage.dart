import 'package:flutter/material.dart';
import 'package:site_inspection/utils/AppColors.dart';
import 'package:site_inspection/utils/AppConstant.dart';

class SitePhotoPage extends StatefulWidget {
  @override
  _SitePhotoPageState createState() => _SitePhotoPageState();
}

class _SitePhotoPageState extends State<SitePhotoPage> {
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
            "Site Photos",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 60,
                                    height: 60,
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
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width-130,
                                    child:Stack(
                                    children: <Widget>[
                                      Text(
                                        "Title",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            fontFamily: fontName,
                                            color: Colors.black),
                                      ),
                                      Positioned(
                                          right: 0,
                                          child: Text(
                                            "Dec 27, 2019",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10,
                                                fontFamily: fontName,
                                                color: Colors.grey),
                                          )),
                                    ],
                                  )
                                  ),
                                  SizedBox(
                                    height: 5,
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
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                fontFamily: fontName,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Door closer in the Main building tend to dislocate the main arm from the Mechanism",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                fontFamily: fontName,
                                color: Colors.black54),
                          )
                        ],
                      )),
                );
              },
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
