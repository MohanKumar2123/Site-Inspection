
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:site_inspection/model/ContactModel.dart';
import 'package:site_inspection/utils/AppColors.dart';
import 'package:site_inspection/utils/AppConstant.dart';
import 'package:site_inspection/utils/ContactInfo.dart';
import 'package:site_inspection/utils/circular_profile_avatar.dart';

class Contactpage extends StatefulWidget {
  List<ContactData> contactdata;

  Contactpage(this.contactdata);





  @override
  _ContactpageState createState() => _ContactpageState();
}

class _ContactpageState extends State<Contactpage> {
  
  SharedPreferences preferences;
  double _offsetContainer;
  var _text;
  var _oldtext;
  var _heightscroller;
  var _itemsizeheight = 65.0; //NOTE: size items
  var _marginRight = 50.0;
  var _sizeheightcontainer;
  var posSelected = 0;
  var diff = 0.0;
  var height = 0.0;
  var txtSliderPos = 0.0;
  ScrollController _controller;
  String message = "";
  
final GlobalKey<State> _keyLoader = new GlobalKey<State>();


  @override
  void initState() {
// TODO: implement initState
    _offsetContainer = 0.0;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    //sort the item list
   

   
    
    super.initState();
    // setState(() {
          
    // });
  }

  
     
    
        _scrollListener() {
          if ((_controller.offset) >= (_controller.position.maxScrollExtent)) {
            print("reached bottom");
          }
          if (_controller.offset <= _controller.position.minScrollExtent &&
              !_controller.position.outOfRange) {
            print("reached top");
          }
        }
      
        void _onVerticalDragUpdate(DragUpdateDetails details) {
          print("_onVerticalDragUpdate");
          setState(() {
            if ((_offsetContainer + details.delta.dy) >= 0 &&
                (_offsetContainer + details.delta.dy) <=
                    (_sizeheightcontainer - _heightscroller)) {
              _offsetContainer += details.delta.dy;
              posSelected =
                  ((_offsetContainer / _heightscroller) % alphabet.length).round();
              _text = alphabet[posSelected];
              if (_text != _oldtext) {
                for (var i = 0; i < widget.contactdata.length; i++) {
                  if (_text.toString().compareTo(widget.contactdata[i].userName.toString().toUpperCase()[0]) == 0) {
                    print(widget.contactdata.length);
                    print("***************************************");
                    _controller.jumpTo(i * _itemsizeheight);
                    break;
                  }
                }
                _oldtext = _text;
              }
            }
          });
        }
      
        void _onVerticalDragStart(DragStartDetails details) {
      //    var heightAfterToolbar = height - diff;
      //    print("height1 $heightAfterToolbar");
      //    var remavingHeight = heightAfterToolbar - (20.0 * 26);
      //    print("height2 $remavingHeight");
      //
      //    var reducedheight = remavingHeight / 2;
      //    print("height3 $reducedheight");
          print("_onVerticalDragStart");
          _offsetContainer = details.globalPosition.dy - diff;
        }
      
        @override
        Widget build(BuildContext context) {
          height = MediaQuery.of(context).size.height;
      
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
                    "Contacts",
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
              body: LayoutBuilder(builder: (context, contrainsts) {
                
                diff = height - contrainsts.biggest.height;
                _heightscroller = (contrainsts.biggest.height) / alphabet.length;
                _sizeheightcontainer = (contrainsts.biggest.height); //NO
                return Row(children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount:   widget.contactdata.length,
                    // itemCount : 1,
                    controller: _controller,
                    itemBuilder: (context, position) {
                      return Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  CircularProfileAvatar(
                                     widget.contactdata[position].photo,
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
                                        widget.contactdata[position].fullname,//modify
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontFamily: fontName,
                                            decoration: TextDecoration.none),
                                      ),
                                      Text(
                                           widget.contactdata[position].role,// modify 
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Colors.grey,
                                            fontFamily: fontName,
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => ContactInfo(
                                contactTo:      widget.contactdata[position].fullname,
                                role:     widget.contactdata[position].role,
                                contactNumber:    widget.contactdata[position].phone,
                                emailTo:   widget.contactdata[position].email,
                                profileImage:     widget.contactdata[position].phone,
                                // modify 
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )),
                  GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragStart: _onVerticalDragStart,
                    child: Container(
                      //height: 20.0 * 26,
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      color: Colors.white,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: []..addAll(
                            new List.generate(
                                alphabet.length, (index) => _getAlphabetItem(index)),
                          ),
                      ),
                    ),
                  ),
                ]);
              }));
        }
      
        ValueGetter callback(int value) {}
      
        _getAlphabetItem(int index) {
          print("_getAlphabetItem");
          return new Expanded(
            child: new Container(
              width: 30,
              height: 20,
              alignment: Alignment.center,
              child: new Text(
                alphabet[index],
                style: (index == posSelected)
                    ? new TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor)
                    : new TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
          );
        }
      }
      
 