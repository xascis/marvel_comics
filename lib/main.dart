import 'package:flutter/material.dart';
import 'package:marvel_comics/home_page.dart';

void main(){
  runApp(new MarvelApp());
}

class MarvelApp extends StatelessWidget {
  final store = Store<AppState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Marvel Comic',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        primaryColorDark: Colors.red[800],
        accentColor: Colors.orangeAccent,
      ),
      home: new MyHomePage(title: 'Marvel'),
    );
  }
}
