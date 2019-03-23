import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marvel_comics/bloc/character_bloc.dart';
import 'package:marvel_comics/common/theme.dart';
import 'package:marvel_comics/features/home/home_screen.dart';

void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'EN'),
      ],
      home: BlocProvider(
        creator: (BuildContext context, BlocCreatorBag bag) => CharacterBloc(context),
        child: HomeScreen()
      ),
      builder: (BuildContext context, Widget child) => _applyTextScaleFactor(child),

    );
  }

  Widget _applyTextScaleFactor(Widget child) {
    return Builder(
      builder: (BuildContext context) {
        if (MediaQuery.of(context).size.width <= 320) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 0.92,
            ),
            child: child,
          );
        } else {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child,
          );
        }
      },
    );
  }
}
