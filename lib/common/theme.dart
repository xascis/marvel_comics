import 'package:flutter/material.dart';

final colorRed = Colors.redAccent; // red
final colorDarkRed = Colors.red[800]; // dark red
final colorBlue = Colors.blueAccent; // azul claro
final colorDarkBlue = Colors.blue[800]; // azul oscuro
final colorLightBlueGrey = Colors.blueGrey[100]; // gris claro
final colorBlueGrey = Colors.blueGrey; // gris medio
final colorDarkBlueGrey = Colors.blueGrey[800]; // gris oscuro

final ThemeData themeData = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = new ThemeData(fontFamily: 'Roboto');

  return base.copyWith(
    platform: TargetPlatform.android,
    brightness: Brightness.light,
    accentColor: colorRed,
    primaryColor: colorDarkRed,
    primaryColorDark: Colors.yellow,
    cardColor: Colors.white,
    hintColor: colorBlueGrey,
    iconTheme: _customIconTheme(base.iconTheme),
    highlightColor: Colors.yellow,
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: _buildButtonTheme(base.buttonTheme),
    textTheme: _buildTextTheme(base.textTheme),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
      filled: false,
      hintStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        // borderSide: BorderSide.none,
      ),
    ),
  );
}

ButtonThemeData _buildButtonTheme(ButtonThemeData base) {
  return base.copyWith(
    buttonColor: colorDarkBlue,
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );
}
TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    subhead: base.subhead.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: colorDarkBlueGrey
    ),
    body1: base.body1.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: colorDarkBlueGrey
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
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
  return original.copyWith(color: colorBlue);
}

TextStyle smallText = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400);
TextStyle regularText = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400);
TextStyle bigText = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400);
TextStyle biggerText = TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400);
TextStyle biggestText = TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400);