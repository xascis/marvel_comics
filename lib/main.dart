import 'package:flutter/material.dart';
import 'package:marvel_comics/common/theme.dart';
import 'package:marvel_comics/features/home/home_screen.dart';

void main(){
  runApp(MarvelApp());
}

class MarvelApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kAppTheme,
      home: HomeScreen(),
    );
  }
}
