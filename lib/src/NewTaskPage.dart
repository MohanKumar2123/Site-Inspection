import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/model/TaskModel.dart';
import 'package:site_inspection/src/AssignedTaskPage.dart';
import 'package:site_inspection/src/TaskDetailsLanding.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  TaskModel taskModel;
  bool assignAndSiteVisiblity = false;
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String userImage = "",
      userName = "",
      userMobile = "",
      userRole = "",
      orgId = "",
      clientId = "";

  SharedPreferences preferences;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  
  var taskType = [
    "Assign Task",
    "Anyway Task",
  ];

  var selectEmployee = [
    "harsh",
    "raju ",
  ];
  // final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  var _currentSelectedValue = "Assign Task";
  var _selectedSiteEnginner = "harsh";
  var titleControl = TextEditingController();
  var locationControl = TextEditingController();
  var descriptionControl = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  String selectedDtae = "";
  String selectedStartTime = "";
  String selectedEndTime = "";

  final dateFormat = DateFormat("yyyy-MM-dd"); 
 

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        selectedDtae = dateFormat.format(selectedDate);
      });
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final dt = DateTime(tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  Future<Null> selectStartTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: startTime);
        print(picked.toString());

    if (picked != null && picked != startTime)
      setState(() {
        startTime = picked;
        selectedStartTime=startTime.format(context);
       
      });
  }

  Future<Null> selectEndTime(BuildContext context) async {
    final TimeOfDay pickedEndTime =
        await showTimePicker(context: context, initialTime: endTime);

    if (pickedEndTime != null && pickedEndTime != endTime)
      setState(() {
        endTime = pickedEndTime;
        selectedEndTime=endTime.format(context);
      });
  }



  changedVisiblity() {
    if (this._currentSelectedValue == "Anyway Task") {
      assignAndSiteVisiblity = false;
    }
    if (this._currentSelectedValue == "Assign Task") {
      assignAndSiteVisiblity = true;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      selectedDtae = dateFormat.format(selectedDate);

      selectedStartTime="start";
       
       selectedEndTime="end";
      changedVisiblity();
    });
    super.initState();
    // getTaskApi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Task Type", style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonHideUnderline(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: DropdownButton(
                  style: TextStyle(
                      fontFamily: fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.grey[400]),
                  items: taskType.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem,
                          style: TextStyle(fontFamily: fontName)),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    setState(() {
                      this._currentSelectedValue = newValueSelected;
                      changedVisiblity();
                    });
                  },
                  value: _currentSelectedValue,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Task Title",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: titleControl,
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(
                  fontFamily: fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Enter Title',
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
              "Date, Time & Location",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/date.png",
                              width: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              selectedDtae,
                              style:
                                  TextStyle(fontFamily: fontName, fontSize: 13),
                            )
                          ],
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[200],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/time.png",
                          width: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () => selectStartTime(context),
                          child: Text(
                            selectedStartTime.toString(),
                            style: TextStyle(
                                fontFamily: fontName, fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                        ),
                        InkWell(
                          onTap: () => selectEndTime(context),
                          child: Text(
                            selectedEndTime.toString(),
                            style: TextStyle(
                                fontFamily: fontName, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: .5,
                    color: Colors.grey[200],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                        child: Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/location.png",
                          width: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: SizedBox(
                                height: 30,
                                child: TextField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: locationControl,
                                  style: TextStyle(
                                      fontFamily: fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: 'Location',
                                    filled: true,
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                        fontFamily: fontName,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey[400]),
                                  ),
                                )))
                      ],
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Visibility(
              visible: assignAndSiteVisiblity,
              child: Text(
                "Assign To ",
                style: TextStyle(fontFamily: fontName),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: assignAndSiteVisiblity,
              child: DropdownButtonHideUnderline(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton(
                    style: TextStyle(
                        fontFamily: fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey[400]),
                    items: selectEmployee.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                            style: TextStyle(fontFamily: fontName)),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      setState(() {
                        this._selectedSiteEnginner = newValueSelected;
                      });
                    },
                    value: _selectedSiteEnginner,
                  ),
                ),
              ),
            ),
            Text(
              "Task Description",
              style: TextStyle(fontFamily: fontName),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(7),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: descriptionControl,
                    style: TextStyle(
                        fontFamily: fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black),
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Enter Task Description',
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                          fontFamily: fontName,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[400]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          InkWell(
                            child: Image.asset(
                              "assets/images/camera.png",
                              color: Colors.grey[300],
                              width: 25,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 25,
                            color: Colors.grey,
                            margin: EdgeInsets.all(10),
                          ),
                        ],
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.only(right: 7),
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
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.only(right: 7),
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
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.only(right: 7),
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
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    
                    //  submitData();
                     AddNewTaskApi();

                  },
                  color: Color(0XFF92B32C),
                  child: Text(
                    "Submit",
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

   AddNewTaskApi() async {

   preferences = await SharedPreferences.getInstance();
    orgId = preferences.getString("orgId");
    clientId = preferences.getString("id");

    Map<String, dynamic> data = Map<String, String>();

    if(this._currentSelectedValue == "Assign Task"){
      data["task_type"] = _currentSelectedValue;
      data["task_name"] = _currentSelectedValue;
      data["task_title"] = titleControl.text;
      data["task_desc"] = _currentSelectedValue;
      data["datetime_from"] = selectedDtae+" "+startTime.toString().substring(10,15)+":00";
      data["datetime_to"] = selectedDtae+" "+endTime.toString().substring(10,15)+":00";
      data["assign_to"] = _selectedSiteEnginner;
      data["project_id"] = _currentSelectedValue;
      data["org_id"] = orgId;
      data["location"] = locationControl.text;
      data["photo[]"] = _currentSelectedValue;
      data["status"] = "1";
    }else if(this._currentSelectedValue == "Anyway Task"){
      data["task_type"] = _currentSelectedValue;
      data["task_name"] = _currentSelectedValue;
      data["task_title"] = titleControl.text;
      data["task_desc"] = _currentSelectedValue;
      data["datetime_from"] = selectedDtae+" "+startTime.toString().substring(10,15)+":00";
      data["datetime_to"] = selectedDtae+" "+endTime.toString().substring(10,15)+":00";
      data["assign_to"] = "";
      data["project_id"] = _currentSelectedValue;
      data["org_id"] = orgId;
      data["location"] = locationControl.text;
      data["photo[]"] = _currentSelectedValue;
      data["status"] = "1";
    }else{
       print("data Error ");
    }

    print(data);

     final response = await http.post(baseURL1 +"project/addTask",
              body: data,
              headers: {
        "Accept": "application/json",
        "Authorization": preferences.getString("token")
      },
       );

              if (response.statusCode == 200) {
            debugPrint( "${response}");
            print("Success ****************************");
            //  if(this._currentSelectedValue == "Assign Task"){
            //     Navigator.pushReplacement( context,
            //   MaterialPageRoute(builder: (context) => AssignedTaskPage()));
            //  }else if(this._currentSelectedValue == "Anyway Task"){
            //     Navigator.pushReplacement( context,
            //   MaterialPageRoute(builder: (context) => TaskDetailsLanding()));
            //  }
             Navigator.pop(context, true);
           

          } else {
            debugPrint("status code${response.body}");
             print("failed ******* ****************************");

          }
   
  }

  void submitData() {
    if (titleControl.text.isNotEmpty) {
      if (selectedDtae.isNotEmpty) {
        if (locationControl.text.isNotEmpty) {
          if (descriptionControl.text.isNotEmpty) {
            // getTaskApi(context);
            // AddNewTaskApi();

          }else{
          Fluttertoast.showToast(
                    msg: "Please fill description",toastLength: Toast.LENGTH_SHORT, 
                    gravity: ToastGravity.BOTTOM, timeInSecForIos: 3,
                    textColor: Colors.black,backgroundColor: Colors.white,fontSize: 16.0
                    );
        }
        }else{
          Fluttertoast.showToast(
                    msg: "Please fill location",toastLength: Toast.LENGTH_SHORT, 
                    gravity: ToastGravity.BOTTOM, timeInSecForIos: 3,
                    textColor: Colors.black,backgroundColor: Colors.white,fontSize: 16.0
                    );
        }
      }else{
          Fluttertoast.showToast(
                    msg: "Please fill date",toastLength: Toast.LENGTH_SHORT, 
                    gravity: ToastGravity.BOTTOM, timeInSecForIos: 3,
                    textColor: Colors.black,backgroundColor: Colors.white,fontSize: 16.0
                    );
        }
    }else{
            Fluttertoast.showToast(
                      msg: "Please fill title",toastLength: Toast.LENGTH_SHORT, 
                      gravity: ToastGravity.BOTTOM, timeInSecForIos: 3,
                      textColor: Colors.black,backgroundColor: Colors.white,fontSize: 16.0
                      );
          }
  }

    Future<void> sendNewTaskData(BuildContext context)async {
       Map<String, dynamic> body = {
    // 'task_type': _currentSelectedValue,
    // 'task_name': selectedDtae,
    // 'task_title': titleControl.text,
    // 'task_desc': descriptionControl.text,
    // 'datetime_from': "",
    // 'datetime_to': "",
    // 'assign_to': "seec",
    // 'project_id': selectedDtae,
    // 'org_id': "",
    // 'location': titleControl.text,
    // 'project_id': "",
    // 'org_id': ""
  };

    }
}


// postNewTaskApi(){
//   // var tit = titleControl.text;
//   debugPrint("titleControl.text");
//   // debugPrint(tit);
//   debugPrint("selectedDtae");
//   debugPrint("locationControl.text");
//   debugPrint("descriptionControl.text");
  
//   debugPrint("*******************************************************");

// }

class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
