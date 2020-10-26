import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/ColorConstants.dart';
import 'package:food_delivery_app/src/controllers/nitinchallan_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/settings_controller.dart';
import '../elements/CircularLoadingWidget.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../elements/SearchBarWidget.dart';
import '../helpers/helper.dart';
import '../repository/user_repository.dart';

class CreateChallanWidget extends StatefulWidget {
  @override
  _CreateChallanWidgetState createState() => _CreateChallanWidgetState();
}

class _CreateChallanWidgetState extends StateMVC<CreateChallanWidget> {
  NitinChallanController _con;

  _CreateChallanWidgetState() : super(NitinChallanController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            S.of(context).Create_challan,
            style: Theme.of(context)
                .textTheme
                .headline6
                .merge(TextStyle(letterSpacing: 1.3)),
          ),
        ),
        body: currentUser.value.id == null
            ? CircularLoadingWidget(height: 500)
            : SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  //key: _con.loginFormKey,  // commented by nitin to test
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.number,
                        //onSaved: (input) => _con.user.name = input,
                        // validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
                        decoration: InputDecoration(
                          labelText: S.of(context).delivery_fee,
                          labelStyle: TextStyle(
                              color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: S.of(context).delivery_fee,
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          prefixIcon: Icon(Icons.car_repair,
                              color: Theme.of(context).accentColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        //onSaved: (input) => _con.user.name = input,
                        // validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_letters : null,
                        decoration: InputDecoration(
                          labelText: S.of(context).Total_amount,
                          labelStyle: TextStyle(
                              color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: S.of(context).Total_amount,
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          prefixIcon: Icon(Icons.person_outline,
                              color: Theme.of(context).accentColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        //onSaved: (input) => _con.user.name = input,
                        // validator: (input) => input.length < 10 ? S.of(context).should_be_more_than_10_letters : null,
                        decoration: InputDecoration(
                          labelText: S.of(context).Compounding_fees,
                          labelStyle: TextStyle(
                              color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: S.of(context).Compounding_fees,
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          prefixIcon: Icon(Icons.phone,
                              color: Theme.of(context).accentColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        // onSaved: (input) => _con.user.email = input,  // commented by nitin to test
                        // validator: (input) => !input.contains('@') ? S.of(context).should_be_a_valid_email : null,
                        decoration: InputDecoration(
                          labelText: S.of(context).remarks,
                          labelStyle: TextStyle(
                              color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: S.of(context).remarks,
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          prefixIcon: Icon(Icons.email_outlined,
                              color: Theme.of(context).accentColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        //onSaved: (input) => _con.user.name = input,
                        // validator: (input) => input.length < 12 ? S.of(context).should_be_more_than_12_characters : null,
                        decoration: InputDecoration(
                          labelText: S.of(context).Extra_fees,
                          labelStyle: TextStyle(
                              color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: S.of(context).Extra_fees,
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          prefixIcon:Icon(Icons.attach_money_outlined,
                              color: Theme.of(context).accentColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        //onSaved: (input) => _con.user.name = input,
                        // validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
                        decoration: InputDecoration(
                          labelText: S.of(context).Photo_description,
                          labelStyle: TextStyle(
                              color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: S.of(context).Photo_description,
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          prefixIcon: Icon(Icons.wysiwyg_sharp,
                              color: Theme.of(context).accentColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              S.of(context).Select_vehicle_images,
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
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
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.2),
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
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.2),
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
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.2),
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
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.2),
                                    onPressed: () {},
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(5.0),
                                    )),
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
                                  S.of(context).select_impounding_document,
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
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
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.2),
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
                      SizedBox(
                        height: 10,
                      ),
                      BlockButtonWidget(
                        text: Text(
                          S.of(context).submit,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor),
                        ),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          // _con.nitinAddOrder();
                          //_con.register();
                        },
                      ),
                      SizedBox(height: 25),
                     // FlatButton(
                     //   onPressed: () {
                     //     // Navigator.of(context).pushNamed('/MobileVerification');
                     //   },
                     //   padding: EdgeInsets.symmetric(vertical: 14),
                     //   color: Theme.of(context).accentColor.withOpacity(0.1),
                     //   shape: StadiumBorder(),
                     //   child: Text(
                     //     'Register with Google',
                     //     textAlign: TextAlign.start,
                     //     style: TextStyle(
                     //       color: Theme.of(context).accentColor,
                     //     ),
                     //   ),
                     // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
