import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/Constants/ColorConstants.dart';
import 'package:food_delivery_app/widgets/CustomFlatButton.dart';
import 'package:food_delivery_app/widgets/CustomTextField.dart';
import 'package:image_picker/image_picker.dart';

class GetChallanScreen extends StatefulWidget {
  static final routeName = "GetChallanScreen";

  @override
  _GetChallanScreenState createState() => _GetChallanScreenState();
}

class _GetChallanScreenState extends State<GetChallanScreen> {
  TextEditingController deliveryfeeController = TextEditingController();
  TextEditingController totalamountController = TextEditingController();
  TextEditingController compoundingfeesController = TextEditingController();
  TextEditingController picdescriptionController = TextEditingController();
  TextEditingController remardController = TextEditingController();
  TextEditingController fee1Controller = TextEditingController();

  var showProgressBar = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        brightness: Brightness.light,
        centerTitle: false,
        title: Text(
          'Challan',
          style: TextStyle(
              fontFamily: 'Manrope-VariableFont_wght',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: -1.1),
        ),
        titleSpacing: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              // Write some code to control things, when user press back button in AppBar
              Navigator.pop(context);
            }),
      ),
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * .0, 20, 0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            true,
                            "Delivery fee",
                            deliveryfeeController,
                            "",
                            true,
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            TextInputType.number,
                            maxLengthPhone: 6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            true,
                            "Total amount",
                            totalamountController,
                            "",
                            true,
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            TextInputType.number,
                            maxLengthPhone: 6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            true,
                            "Compounding fees",
                            compoundingfeesController,
                            "",
                            true,
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            TextInputType.number,
                            maxLengthPhone: 6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            true,
                            "Photo description",
                            picdescriptionController,
                            "",
                            true,
                            new WhitelistingTextInputFormatter(
                                RegExp("[a-zA-Z0-9]")),
                            TextInputType.text,
                            maxLengthPhone: 255,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            true,
                            "Remarks",
                            remardController,
                            "",
                            true,
                            new WhitelistingTextInputFormatter(
                                RegExp("[a-zA-Z0-9]")),
                            TextInputType.text,
                            maxLengthPhone: 255,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            true,
                            "Extra fee",
                            fee1Controller,
                            "",
                            true,
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            TextInputType.number,
                            maxLengthPhone: 6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Select vehicle images',
                                  style: TextStyle(
                                      fontFamily: 'Manrope-VariableFont_wght',
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -1.1),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: FlatButton(
                                        height: 70,
                                        padding: EdgeInsets.zero,
                                        child: Center(
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Dark_Gray_Color,
                                          ),
                                        ),
                                        color: LightBlueColor,
                                        onPressed: () {},
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                        height: 70,
                                        padding: EdgeInsets.zero,
                                        child: Center(
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Dark_Gray_Color,
                                          ),
                                        ),
                                        color: LightBlueColor,
                                        onPressed: () {},
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                        height: 70,
                                        padding: EdgeInsets.zero,
                                        child: Center(
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Dark_Gray_Color,
                                          ),
                                        ),
                                        color: LightBlueColor,
                                        onPressed: () {},
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                        height: 70,
                                        padding: EdgeInsets.zero,
                                        child: Center(
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Dark_Gray_Color,
                                          ),
                                        ),
                                        color: LightBlueColor,
                                        onPressed: () {},
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Select Impounding document',
                                  style: TextStyle(
                                      fontFamily: 'Manrope-VariableFont_wght',
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -1.1),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  FlatButton(
                                      height: 70,
                                      minWidth: 90,
                                      padding: EdgeInsets.zero,
                                      child: Center(
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Dark_Gray_Color,
                                        ),
                                      ),
                                      color: LightBlueColor,
                                      onPressed: () {},
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(5.0),
                                      )),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          showProgressBar
                              ? Center(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Theme.of(context).primaryColor),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.only(left: 0, right: 0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Spacer(),
                                            Container(
                                              height: 45,
                                              width: 45,
                                              alignment: Alignment.center,
                                              child: FlatButton(
                                                  padding: EdgeInsets.zero,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.arrow_forward,
                                                      color: BlueColor,
                                                    ),
                                                  ),
                                                  color: LightBlueColor,
                                                  onPressed: () {},
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(0.0),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
