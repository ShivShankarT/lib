import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/Constants/ColorConstants.dart';

class CustomTextField extends StatelessWidget {
  String hint;
  TextEditingController contoller;
  String icon;
  bool isPassword = false;
  WhitelistingTextInputFormatter inputFormatter;
  TextInputType textType;
  int maxLengthPhone = 0;

  bool isEnable = false;
  CustomTextField(this.isEnable, this.hint, this.contoller, this.icon,
      this.isPassword, this.inputFormatter, this.textType,
      {this.maxLengthPhone});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: new ThemeData(
          primaryColor: Color(0xFF808080), primaryColorDark: Color(0xFF808080)),
      child: TextField(
        enabled: isEnable,
        keyboardType: textType,
        style: TextStyle(
          fontFamily: 'Manrope-VariableFont_wght',
          fontSize: 16,
          color: Color(0xFF808080),
          fontWeight: FontWeight.w500,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLengthPhone)
        ],
        obscureText: isPassword,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(17),
            filled: true,
            fillColor: Color(0xFFF2F2F2),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x33ffffff),
                  width: 0.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(0))),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide:
              const BorderSide(color: Color(0xFFF2F2F2), width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide(width: 1.0, color: Color(0xFFF2F2F2)),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x33ffffff),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            hintText: hint,
            hintStyle: TextStyle(color: Color(0xFF808080))),
        maxLines: 1,
        controller: contoller,
      ),
    );
  }
}
