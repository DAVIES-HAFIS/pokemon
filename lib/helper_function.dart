import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppColors {
  AppColors._();
  static const Color deepBlue = Color(0xff051048);
  static const Color skyBlue = Color(0xff1162FF);
  static const Color white = Color(0xffffffff);
  static const Color lightwhite = Color(0xffe5e5e5);
  static const Color deepGrey = Color(0xff212121);
  static const Color lightGrey = Color(0xffC4C4C4);
  static const Color darkWhite = Color(0xffF1EEFC);
  static const Color darkGreen = Color(0xff136A2B);
  static const Color grey = Color(0xffCCCCCC);

}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Widget addSeperator(Color color, double height) {
  return Divider(color: color, height: height);
}

Widget addVerticalSpacing(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpacing(double width) {
  return SizedBox(width: width);
}