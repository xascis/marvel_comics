import 'package:flutter/material.dart';

const kAppColor1 = const Color(0xffF8F8F8);
const kAppColor2 = const Color(0xffECEFF1);
const kAppColor3 = const Color(0xffB9B9B9);
const kAppColor4 = const Color(0xff8E8E8E);
const kAppColor5 = const Color(0xffFF1849);
const kAppColor6 = const Color(0xff0E254F);
const kAppColor7 = const Color(0xff5CBBFE);

final ThemeData kAppTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = new ThemeData(fontFamily: 'Roboto');

  return base.copyWith(
    brightness: Brightness.light,
    accentColor: kAppColor7,
    primaryColor: kAppColor7,
    primaryColorDark: Colors.yellow,
    cardColor: Colors.white,
    // indicatorColor: kAppColor1,
    hintColor: kAppColor2,
    iconTheme: _customIconTheme(base.iconTheme),
    highlightColor: Colors.yellow[200],
    scaffoldBackgroundColor: Colors.white,
    buttonColor: kAppColor7,
    textTheme: _buildTextTheme(base.textTheme),
//    inputDecorationTheme: InputDecorationTheme(
//      filled: true,
//      fillColor: kAppColor2,
//      hintStyle: TextStyle(color: kAppColor4),
//      border: OutlineInputBorder(
//        borderRadius: BorderRadius.circular(8.0),
//        borderSide: BorderSide.none,
//      ),
//      labelStyle: TextStyle(
//        color: kAppColor6,
//      )
//    ),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    subhead: base.subhead.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 15.0,
      color: kAppColor6
    ),
    body1: base.body1.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 15.0,
      color: kAppColor6
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 15.0,
      color: Colors.white,
    ),
    // others
    body2: base.body2.copyWith(
      color: Colors.red,
    ),
    title: base.title.copyWith(
      color: Colors.red,
    ),
    caption: base.caption.copyWith(
      color: Colors.red,
    ),
    display1: base.display1.copyWith(
      color: Colors.red,
    ),
    display2: base.display2.copyWith(
      color: Colors.red,
    ),
    display3: base.display3.copyWith(
      color: Colors.red,
    ),
    display4: base.display4.copyWith(
      color: Colors.red,
    ),
    headline: base.headline.copyWith(
      color: Colors.red,
    ),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kAppColor3);
}