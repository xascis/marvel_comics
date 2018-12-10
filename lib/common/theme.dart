import 'package:flutter/material.dart';

final kAppColor1 = Colors.redAccent; // red
final kAppColor2 = Colors.red[800]; // dark red
final kAppColor3 = Colors.blueAccent; // azul claro
final kAppColor4 = Colors.blue[800]; // azul oscuro
final kAppColor5 = Colors.blueGrey[800]; // gris oscuro
final kAppColor6 = Colors.blueGrey; // gris medio
final kAppColor7 = Colors.blueGrey[100]; // gris claro

final ThemeData kAppTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = new ThemeData(fontFamily: 'Roboto');

  return base.copyWith(
    platform: TargetPlatform.android,
    brightness: Brightness.light,
    accentColor: kAppColor1,
    primaryColor: kAppColor2,
    primaryColorDark: Colors.yellow,
    cardColor: Colors.white,
    // indicatorColor: kAppColor1,
    hintColor: kAppColor6,
    iconTheme: _customIconTheme(base.iconTheme),
    highlightColor: Colors.yellow[200],
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: _buildButtonTheme(base.buttonTheme),
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

ButtonThemeData _buildButtonTheme(ButtonThemeData base) {
  return base.copyWith(
    buttonColor: kAppColor4,
  );
}
TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    subhead: base.subhead.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 15.0,
      color: kAppColor5
    ),
    body1: base.body1.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 15.0,
      color: kAppColor5
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