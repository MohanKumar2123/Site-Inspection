import 'package:flutter/material.dart';
import 'package:site_inspection/src/SubDocumentPage.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/FadeRoute.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
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
            "Documents",
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
            margin: EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: doclabels.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child:Container(
                    color: Colors.white,
                    child: Center(child: Text(doclabels[index])),
                  ),
                  onTap: (){
                    Navigator.push(context, FadeRoute(page: SubDocumentPage(title: doclabels[index],)));
                  },
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
