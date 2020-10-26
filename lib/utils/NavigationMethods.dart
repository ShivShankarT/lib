import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


Future<T> pushPage<T>(BuildContext context, Widget page) {
  return Navigator.push<T>(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

Future<T> replacePageWithNewParent<T>(BuildContext context, Widget page) {
  return Navigator.pushAndRemoveUntil<T>(
    context,
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}

Future<T> replaceWithPage<T>(BuildContext context, Widget page) {
  return Navigator.of(context).pushReplacement(
      new MaterialPageRoute(builder: (BuildContext context) => page));
}

Future<T> replacePage<T>(
    BuildContext context,
    Widget page,
    String routName,
    ) {
  return Navigator.pushAndRemoveUntil<T>(
    context,
    MaterialPageRoute(
      settings: RouteSettings(name: routName),
      builder: (context) => page,
    ),
        (route) => false,
  );
}



Future<T> pushPageWithDownToUp<T>(
    BuildContext context,
    Widget page,
    routName,
    ) {
  return Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.bottomToTop,
          child: page,
          duration: Duration(milliseconds: 400)));
}

Future<T> pushPageWithRightToLeft<T>(
    BuildContext context,
    Widget page,
    routName,
    ) {
  return Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft,
          child: page,
          duration: Duration(milliseconds: 400)));
}

Future<T> replacePageWithRightToLeft<T>(
    BuildContext context,
    Widget page,
    routName,
    ) {
  return Navigator.pushReplacement(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft,
          child: page,
          duration: Duration(milliseconds: 400)));
}

Future<T> replaceTopToBottom<T>(
    BuildContext context,
    Widget page,
    routName,
    ) {
  return Navigator.pushReplacement(
      context,
      PageTransition(
          type: PageTransitionType.topToBottom,
          child: page,
          duration: Duration(milliseconds: 300)));
}

bool isThisScreenIsAtTop(
    BuildContext context,
    String routeName,
    ) {
  bool currentScreen = false;
  Navigator.popUntil(context, (route) {
    if (route.settings.name != routeName) {
      currentScreen = false;
    } else {
      currentScreen = true;
    }
    return true;
  });
  return currentScreen;
}

