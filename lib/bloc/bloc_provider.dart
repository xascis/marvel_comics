import 'package:flutter/material.dart';
import 'package:marvel_comics/bloc/bloc_base.dart';

class BlocProvider<T extends BlocBase> extends InheritedWidget {
  final T bloc;
  
  BlocProvider({Key key, Widget child, this.bloc}) : super(key: key, child: child);

  bool updateShouldNotify (_) => true;

  static T of<T extends BlocBase> (BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.inheritFromWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}