import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class OTPVerification extends StatefulWidget {
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
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
            "Verification",
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
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter 4 digit code that was sent to +968-9782525381.",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    decoration: TextDecoration.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 64.0,
                 
                child: Card(
                    color: Color(0XFFF8F8F8),
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: PinEntryTextField(
                        onSubmit: (String pin) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Pin"),
                                  content: Text('Pin entered is $pin'),
                                );
                              }); //end showDialog()
                        }, // end onSubmit
                      ),
                    ))),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {},
                color: Color(0XFF92B32C),
                child: Text(
                  "Verify",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
