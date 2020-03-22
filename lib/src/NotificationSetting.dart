import 'package:flutter/material.dart';
import 'package:site_inspection/utils/AppColors.dart';

class NotificationSetting extends StatefulWidget {
  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back, color: Colors.white),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppColors.primaryColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Notification Settings",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'OpenSans',
                decoration: TextDecoration.none),
          ),
        ),
      ),
      body: Container(
        height: (MediaQuery.of(context).size.height / 2) -105,
        color: AppColors.bgColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Padding(
                    padding: EdgeInsets.all(7),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Tasks",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                decoration: TextDecoration.none),
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {
                              setState(() {});
                            },
                            
                          )
                        ],
                      ),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Colors.grey[300],
                ),
                Padding(
                    padding: EdgeInsets.all(7),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Site Photos",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                decoration: TextDecoration.none),
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {
                              setState(() {});
                            },
                            
                          )
                        ],
                      ),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Colors.grey[300],
                ), Padding(
                    padding: EdgeInsets.all(7),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Communication",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                decoration: TextDecoration.none),
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {
                              setState(() {});
                            },
                            
                          )
                        ],
                        
                      ),
                    )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                     Padding(
                    padding: EdgeInsets.all(7),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Notice",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                decoration: TextDecoration.none),
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {
                              setState(() {});
                            },
                            
                          )
                        ],
                        
                      ),
                    )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                     Padding(
                    padding: EdgeInsets.all(7),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Documents",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                decoration: TextDecoration.none),
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {
                              setState(() {});
                            },
                             
                          )
                        ],
                        
                      ),
                    )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                     Padding(
                    padding: EdgeInsets.all(7),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Reports",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                decoration: TextDecoration.none),
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {
                              setState(() {});
                            },
                           
                          )
                        ],
                        
                      ),
                    )),
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}
