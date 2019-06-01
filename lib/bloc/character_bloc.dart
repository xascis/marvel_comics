import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_comics/domain/models/character.dart';
import 'package:marvel_comics/domain/usecases/character/get_character.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc implements Bloc {
  final _character = BehaviorSubject<CharacterState>.seeded(CharacterState.initial());
  Observable<CharacterState> get characterList => _character.stream;

  final _search = BehaviorSubject<String>();
  Observable<String> get searchText => _search.stream.transform(validateText);

  Function(String) get searchName => _search.sink.add;

  Future<void> _getCharacterList(String text) async {
    _character.sink.add(_character.value.copyWith(isLoading: true));

    final response = await GetCharacter()(name: text).catchError((e) => _character.sink.addError("$e"));

    if (response != null) _character.sink.add(CharacterState(false, response));
  }

  CharacterBloc(BuildContext context) {
    searchText.debounce(Duration(seconds: 3)).listen((text) {
      _getCharacterList(text);
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  final validateText = StreamTransformer<String, String>.fromHandlers(
    handleData: (String text, EventSink<String> sink) {
      if (text.length > 2) sink.add(text);
    }
  );

  void dispose() async {
    await _character.close();
    await _search.close();
  }

}

class CharacterState {
  final bool isLoading;
  final List<Character> characterList;

  CharacterState(this.isLoading, this.characterList);

  factory CharacterState.initial() {
    return CharacterState(false, []);
  }

  CharacterState copyWith({bool isLoading, List characterList}) {
    return CharacterState(
      isLoading ?? this.isLoading,
      characterList ?? this.characterList
    );
  }
}