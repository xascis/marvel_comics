import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marvel_comics/bloc/bloc_provider.dart';
import 'package:marvel_comics/bloc/character_bloc.dart';
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', 'ES'),
        const Locale('en', 'EN'),
      ],
      home: BlocProvider(
        bloc: CharacterBloc(),
        child: HomeScreen()
      ),
    );
  }
}
