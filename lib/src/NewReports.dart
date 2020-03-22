import 'package:flutter/material.dart';
import 'package:site_inspection/utils/AppConstant.dart';

class NewReports extends StatefulWidget {
  @override
  _NewReportsState createState() => _NewReportsState();
}

class _NewReportsState extends State<NewReports> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Department",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                  fontFamily: fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Select Department',
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontFamily: fontName,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400]),
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey[400],
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Site Progress",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                  fontFamily: fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black),
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter Comments Here..',
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontFamily: fontName,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Quality Observation",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                  fontFamily: fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black),
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter Comments Here..',
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontFamily: fontName,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Safety Observation",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                  fontFamily: fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black),
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter Comments Here..',
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontFamily: fontName,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Site Instructions",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                  fontFamily: fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black),
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter Comments Here..',
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontFamily: fontName,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Miscellaneous",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                  fontFamily: fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black),
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter Comments Here..',
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontFamily: fontName,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Attachments",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 70,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
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
                    width: 50,
                    height: 50,
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
                    width: 50,
                    height: 50,
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
                    width: 50,
                    height: 50,
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
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Image.asset(
                          "assets/images/camera.png",
                          color: Colors.grey,
                          width: 30,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.grey,
                        margin: EdgeInsets.all(10),
                      ),
                      InkWell(
                        child: Image.asset(
                          "assets/images/folder.png",
                          color: Colors.grey,
                          width: 30,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
             Text(
              "Sent To",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                  fontFamily: fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Multiple Contact Select',
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontFamily: fontName,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400]),
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey[400],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0XFF92B32C),
                  child: Text(
                    "Send Report",
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
