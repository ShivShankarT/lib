import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  String title;
  Function onPressed;
  double fontSize = 16;

  CustomFlatButton({this.title, this.onPressed, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: fontSize,
            fontFamily: 'Boing_bold',
            fontWeight: FontWeight.bold,
          ),
        ),
      onPressed: onPressed,

    );
  }
}

class CustomFlatButton1 extends StatelessWidget {
  Text title;
  Function onPressed;

  CustomFlatButton1({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: title,
      onPressed: onPressed,

    );
  }
}

class CustomFlatButtonIcon extends StatelessWidget {
  Icon icon;
  Function onPressed;

  CustomFlatButtonIcon({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: icon,
      onPressed: onPressed,

    );
  }
}
