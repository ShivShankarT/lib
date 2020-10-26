import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/ColorConstants.dart';
import 'package:food_delivery_app/src/controllers/nitinchallan_controller.dart';
import 'package:food_delivery_app/src/pages/Create_challan.dart';
import 'package:food_delivery_app/utils/NavigationMethods.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/settings_controller.dart';
import '../elements/CircularLoadingWidget.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../elements/SearchBarWidget.dart';
import '../helpers/helper.dart';
import '../repository/user_repository.dart';

class NitinChallanWidget extends StatefulWidget {
  @override
  _NitinChallanWidgetState createState() => _NitinChallanWidgetState();
}

class _NitinChallanWidgetState extends StateMVC<NitinChallanWidget> {
  NitinChallanController _con;

  _NitinChallanWidgetState() : super(NitinChallanController()) {
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
            S.of(context).Vehicle_search,
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
                              keyboardType: TextInputType.text,
                              //onSaved: (input) => _con.user.name = input,
                              validator: (input) => input.length < 3
                                  ? S.of(context).should_be_more_than_3_letters
                                  : null,
                              decoration: InputDecoration(
                                labelText: S.of(context).Search_for_the_owner,
                                labelStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                contentPadding: EdgeInsets.all(12),
                                hintText: S.of(context).Search_for_the_owner,
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.7)),
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
                                  prefixIcon: Icon(Icons.search,
                                      color: Theme.of(context).accentColor),
                                  suffixIcon: Container(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.1),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          //_con.hidePassword = !_con.hidePassword;//  // commented by nitin to test
                                        });
                                      },

                                      color: Theme.of(context).focusColor,
                                      //icon: Icon(_con.hidePassword ? Icons.visibility : Icons.visibility_off),
                                      icon: Center(child: Icon(Icons.filter_list)),
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              //onSaved: (input) => _con.user.name = input,
                              validator: (input) => input.length < 3
                                  ? S.of(context).should_be_more_than_3_characters
                                  : null,
                              decoration: InputDecoration(
                                labelText: S.of(context).vehicle_number,
                                labelStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                contentPadding: EdgeInsets.all(12),
                                hintText: S.of(context).vehicle_number,
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
                              keyboardType: TextInputType.text,
                              //onSaved: (input) => _con.user.name = input,
                              validator: (input) => input.length < 3
                                  ? S.of(context).should_be_more_than_3_letters
                                  : null,
                              decoration: InputDecoration(
                                labelText: S.of(context).owner_name,
                                labelStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                contentPadding: EdgeInsets.all(12),
                                hintText: S.of(context).owner_name,
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
                              validator: (input) => input.length < 10
                                  ? S.of(context).should_be_more_than_10_letters
                                  : null,
                              decoration: InputDecoration(
                                labelText: S.of(context).mobile,
                                labelStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                contentPadding: EdgeInsets.all(12),
                                hintText: S.of(context).mobile,
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
                              keyboardType: TextInputType.emailAddress,
                              // onSaved: (input) => _con.user.email = input,  // commented by nitin to test
                              validator: (input) => !input.contains('@')
                                  ? S.of(context).should_be_a_valid_email
                                  : null,
                              decoration: InputDecoration(
                                labelText: S.of(context).email,
                                labelStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                contentPadding: EdgeInsets.all(12),
                                hintText: S.of(context).email,
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
                            Row(
                              children: [
                                Expanded(
                                  child:TextFormField(
                                  keyboardType: TextInputType.number,
                                  //onSaved: (input) => _con.user.name = input,
                                  validator: (input) => input.length < 12
                                      ? S.of(context).should_be_more_than_12_characters
                                      : null,
                                  decoration: InputDecoration(
                                    labelText: S.of(context).owner_adhar,
                                    labelStyle: TextStyle(
                                        color: Theme.of(context).accentColor),
                                    contentPadding: EdgeInsets.all(12),
                                    hintText: S.of(context).owner_adhar,
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
                    ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    //onSaved: (input) => _con.user.name = input,
                                    validator: (input) => input.length < 3
                                        ? S.of(context).should_be_more_than_3_characters
                                        : null,
                                    decoration: InputDecoration(
                                      labelText: S.of(context).owner_pan,
                                      labelStyle: TextStyle(
                                          color: Theme.of(context).accentColor),
                                      contentPadding: EdgeInsets.all(12),
                                      hintText: S.of(context).owner_pan,
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
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              //onSaved: (input) => _con.user.name = input,
                              validator: (input) => input.length < 3
                                  ? S.of(context).should_be_more_than_3_characters
                                  : null,
                              decoration: InputDecoration(
                                labelText: S.of(context).vehicle_rto,
                                labelStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                contentPadding: EdgeInsets.all(12),
                                hintText: S.of(context).vehicle_rto,
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.7)),
                                prefixIcon: Icon(Icons.article_outlined,
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
                              validator: (input) => input.length < 3
                                  ? S.of(context).should_be_more_than_3_characters
                                  : null,
                              decoration: InputDecoration(
                                labelText: S.of(context).vehicle_type,
                                labelStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                contentPadding: EdgeInsets.all(12),
                                hintText: S.of(context).vehicle_type,
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
                              keyboardType: TextInputType.text,
                              //onSaved: (input) => _con.user.name = input,
                              validator: (input) => input.length < 3
                                  ? S.of(context).should_be_more_than_3_characters
                                  : null,
                              decoration: InputDecoration(
                                labelText: S.of(context).vehicle_make,
                                labelStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                contentPadding: EdgeInsets.all(12),
                                hintText: S.of(context).vehicle_make,
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
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    //onSaved: (input) => _con.user.name = input,
                                    validator: (input) => input.length < 4
                                        ? S.of(context).should_be_more_than_4_characters
                                        : null,
                                    decoration: InputDecoration(
                                      labelText: S.of(context).vehicle_year,
                                      labelStyle: TextStyle(
                                          color: Theme.of(context).accentColor),
                                      contentPadding: EdgeInsets.all(12),
                                      hintText: S.of(context).vehicle_year,
                                      hintStyle: TextStyle(
                                          color: Theme.of(context)
                                              .focusColor
                                              .withOpacity(0.7)),
                                      prefixIcon: Icon(Icons.calendar_today_outlined,
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
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child:TextFormField(
                                    keyboardType: TextInputType.text,
                                    //onSaved: (input) => _con.user.name = input,
                                    validator: (input) => input.length < 4
                                        ? S.of(context).should_be_more_than_4_characters
                                        : null,
                                    decoration: InputDecoration(
                                      labelText: S.of(context).vehicle_color,
                                      labelStyle: TextStyle(
                                          color: Theme.of(context).accentColor),
                                      contentPadding: EdgeInsets.all(12),
                                      hintText: S.of(context).vehicle_color,
                                      hintStyle: TextStyle(
                                          color: Theme.of(context)
                                              .focusColor
                                              .withOpacity(0.7)),
                                      prefixIcon: Icon(Icons.color_lens_outlined,
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
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            BlockButtonWidget(
                              text: Text(
                                S.of(context).submit,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              color: Theme.of(context).accentColor,
                              onPressed: () {
                                // _con.nitinAddOrder();

                                pushPage(context, CreateChallanWidget());

                                //_con.register();
                              },
                            ),
                            SizedBox(height: 25),
//                      FlatButton(
//                        onPressed: () {
//                          Navigator.of(context).pushNamed('/MobileVerification');
//                        },
//                        padding: EdgeInsets.symmetric(vertical: 14),
//                        color: Theme.of(context).accentColor.withOpacity(0.1),
//                        shape: StadiumBorder(),
//                        child: Text(
//                          'Register with Google',
//                          textAlign: TextAlign.start,
//                          style: TextStyle(
//                            color: Theme.of(context).accentColor,
//                          ),
//                        ),
//                      ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
