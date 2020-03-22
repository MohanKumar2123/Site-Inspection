import 'package:flutter/material.dart';
import 'package:site_inspection/service/calls_and_messages_service.dart';
import 'package:site_inspection/service/service_locator.dart';


import 'AppConstant.dart';
import 'circular_profile_avatar.dart';

class ContactInfo extends StatelessWidget {
    final CallsAndMessagesService _service = locater<CallsAndMessagesService>();
  final String contactTo;
  final String role;

 final String profileImage;

  final String contactNumber;

  String emailTo;

  ContactInfo({
    @required this.contactTo,   @required this.role, @required this.contactNumber, @required this.profileImage,@required this.emailTo
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    CircularProfileAvatar(// modify
                      profileImage,
                      errorWidget: (context, url, error) => Container(
                        child: Icon(Icons.error),
                      ),
                      placeHolder: (context, url) => Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      borderWidth: 1,
                      borderColor: Colors.white,
                      elevation: 2.0,
                      cacheImage: true,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          contactTo,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: fontName,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          role,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.grey,
                              fontFamily: fontName,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: InkWell(child: Icon(Icons.clear),
                    onTap: (){
                      Navigator.of(context).pop();
                    },),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            height: 1,
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/call.png",
                        width: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Call",
                        style: TextStyle(
                            fontFamily: fontName, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  onTap: () {
                      _service.call(contactNumber);
                    
                  },
                ),
                InkWell(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/mail.png",
                        width: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                         emailTo.substring(0,10),
                        style: TextStyle(
                            fontFamily: fontName, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  onTap: () {
                  _service.sendEmail(emailTo);

                  },
                ),
                InkWell(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/comments.png",
                        width: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(
                            fontFamily: fontName, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  onTap: () {
                  

                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
