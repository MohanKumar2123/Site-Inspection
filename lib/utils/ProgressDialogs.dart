import 'package:flutter/material.dart';

class ProgressDialogs {
  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 10,),
                        Text("Please Wait...",style: TextStyle(color: Colors.black),)
                      ]),
                    )
                  ]));
        });
  }
}